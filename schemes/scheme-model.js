const db = require('../data/db-config');

module.exports = {
    find() {
        return db.select('*')
        .from('schemes')
    },
    findById(id) {
        return db.select('*')
        .from('schemes as s')
        .where('s.id', id)
    },
    findSteps(id) {
        return db('steps as st')
        .innerJoin('schemes as sc', 'sc.id','st.scheme_id')
        .where('st.scheme_id', id)
        .select('sc.id', 'sc.scheme_name', 'st.step_number', 'st.instructions')
        .orderBy('st.step_number')
    },
    add(scheme){
        return db('schemes')
        .insert(scheme)
    },
    update(changes, id){
        return db('schemes')
        .where('id', id)
        .update(changes)
    },
    remove(id){
        return db('schemes')
        .where('id', id)
        .del()
    }
}
