import jwt from 'jsonwebtoken';

function CreateJsonToken(data){
    return jwt.sign({id: data}, process.env.SECRETJWT, {expiresIn: '3d'});
}

function VerifyToken(data){
    try{
        return jwt.verify(data, process.env.SECRETJWT);
    }
    catch(error){
        return null;
    }
}

export {VerifyToken, CreateJsonToken}