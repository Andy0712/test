

import invokers from "../../../invokers";
import request from "../../../common/js/request";
export async function AddRole({commit},formDate){
    let rep = await request(
        invokers.services.Role.AddInsert,
        formDate,
        "branch",
        'application/json'
    );
    return rep.data;
}

export async function seachList({commit},seachDate){
    let rep = await request(
        invokers.services.Role.RoleList,
        seachDate,
        "branch",
        'application/json'
    );
    return rep.data;
}

export async function deleted({commit},rolenos){
    let rep = await request(
        invokers.services.Role.Deleted,
        {rolenos:rolenos},
        "branch",
        'application/json'
    );
    return rep.data;
}

export async function edit({commit},editForm){
    let rep = await request(
        invokers.services.Role.Edit,
        editForm,
        "branch",
        'application/json'
    );
    return rep.data;
}

export async function UpFile({commit},file){
    let rep = await request(
        invokers.services.Role.UpFile,
        file,
        "branch",
        "multipart/form-data"
    );
    return rep.data;
}


