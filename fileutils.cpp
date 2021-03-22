#include "fileutils.h"
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QPair>

const QString FileUtils::fileName = "setup.conf";

FileUtils::FileUtils(QObject *parent):QObject(parent)
{
    readFile();
}

void FileUtils::readFile()
{
    try {
        QFile file(fileName);

        if (!file.open(QIODevice::ReadOnly | QIODevice::Text))
            return;

        QTextStream in(&file);
        int rowNum = 0;
        int setUp = -1;

        while (!in.atEnd()){
            QString line = in.readLine();
            if (rowNum > 0){
                QStringList list = line.split(" ");
                numbers[setUp].append(qMakePair(list.at(0).trimmed().toDouble(),list.at(1).trimmed().toDouble()));
                rowNum--;
            }else{
                setUp++;
                rowNum = line.trimmed().toInt();
            }
        }

    } catch (...) {
        qInfo()<<"Error in reading file";
        return;
    }
}

QMap<int, QList<QPair<double, double> > > FileUtils::getNumbers() const
{
    return numbers;
}
