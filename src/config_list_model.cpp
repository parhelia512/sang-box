#include "config_list_model.h"

ConfigListModel::ConfigListModel(ConfigManagerPtr configManager)
    : QAbstractItemModel()
    , m_configManager(configManager)
{}

int ConfigListModel::rowCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return m_configManager->configCount();
}


int ConfigListModel::columnCount(const QModelIndex &parent) const
{
    Q_UNUSED(parent);
    return 1;
}

QVariant ConfigListModel::data(const QModelIndex &index, int role) const
{
    if (index.row() < 0 || index.row() >= m_configManager->configCount())
        return QVariant();

    switch (role) {
    case NameRole:
        return m_configManager->configName(index.row());
        break;
    case SelectedRole:
        return m_configManager->configIndex() == index.row();
        break;
    default:
        return QVariant();
        break;
    }
}

QModelIndex ConfigListModel::index(int row, int column, const QModelIndex &parent) const
{
    return createIndex(row, column, nullptr);
}

QModelIndex ConfigListModel::parent(const QModelIndex &child) const
{
    return QModelIndex();
}

void ConfigListModel::switchConfig(int index)
{
    if (index >= 0) {
        m_configManager->switchConfig(index);
    }
    const QModelIndex modelIndex = this->index(index, 0);
    emit dataChanged(modelIndex, modelIndex);
}

QHash<int, QByteArray> ConfigListModel::roleNames() const
{
    QHash<int, QByteArray> roles;
    roles[NameRole] = "name";
    return roles;
}
