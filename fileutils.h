#ifndef FILEUTILS_H
#define FILEUTILS_H

#include<QObject>
#include<QList>
#include<QMap>
#include<QString>

class FileUtils : public QObject
{
    Q_OBJECT
public:
    explicit FileUtils(QObject *parent = nullptr);

private:
    static const QString fileName;
    QMap<int , QList<QPair<double,double>>> numbers;
    void readFile();

public slots:
    QMap<int, QList<QPair<double, double> > > getNumbers() const;

};

#endif // FILEUTILS_H
