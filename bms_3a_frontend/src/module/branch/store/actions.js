

import invokers from "../../../invokers";
import request from "../../../common/js/request";
export async function searchList({commit},formInline){
    let rep = await request(
        invokers.services.branchList.AllList,
        formInline,
        "branch",
        'application/json'
    )
    return rep.data;
}

export async function submit_Form({ commit },formLabelAlign){
    let rep = await request(
        invokers.services.branchList.Add_Branch,
        formLabelAlign,
        "branch",
        'application/json'
    )
    return rep.data;
}

export async function editStatus({commit},branchid){
    let rep = await request(
        invokers.services.branchList.EditStatus,
        {branchid:branchid},
        "branch",
        'application/json'
    )
    return rep.data;
}

export async function upDate({commit},formDate){
    let rep = await request(
        invokers.services.branchList.Update,
        formDate,
        "branch",
        'application/json'
    )
    return rep.data;
}