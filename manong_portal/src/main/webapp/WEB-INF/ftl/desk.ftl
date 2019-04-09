<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>收银台</title>
    <style>
        *{
            margin: 0;padding: 0;
        }
        #root{
            display: flex;
            justify-content: center;
            background-color: #f5f6f7;
        }
        @media screen and (min-width:900px){
            .wrapper{
                width: 980px;
            }
        }
        .footer{
            text-align: center;
            height: 100px;
            width: 100%;
            margin-top: 20px;
            border-top: 1px solid #8b8b8b;
        }
        .wrapper{
            max-width: 1100px;
            padding: 0 20px;
            background-color: #ffffff;
        }
        .header-top{
            display: flex;
            height: 80px;
            align-items: stretch;
            padding: 10px 0;
        }
        .logo{
            background-color: #efefef;
            width: 200px;
            margin-right: 20px;
        }
        .system-name{
            padding: 0 20px;
            line-height: 80px;
            font-size: 20px;
            font-weight: 600;
            border-left: 2px solid #cfcfcf;
            color: #999;
        }
        .header-bottom{
            border-top: 4px solid #A4D092;
            background-color: #F2FDED;
            padding: 20px 20px 20px 40px;
            box-sizing: border-box;
            color: #afafaf;
        }
        .order-cell{
            padding: 10px 0;
        }
        .order-id,.order-desc{
            color: #333;
        }
        .order-amount{
            color: red;
            font-weight: 600;
        }
        .container{
            min-height: 480px;
            padding: 10px 0;
        }

        .way-cell{
            padding: 20px;
            margin-bottom: 20px;
            border:1px solid #cfcfcf;
        }
        .way-cell-title{
            padding-bottom: 10px;
            border-bottom: 1px solid #A4D092;
            margin-bottom: 20px;
            font-weight: bold;
        }
        .way-choose-bank{
            display: flex;
            flex-wrap: wrap;
        }

        .way-choose-bank-cell{
            display: inline-block;
            box-sizing: border-box;
            padding: 0 6px 0 30px;
            width: 200px;
            height: 56px;
            margin-right: 20px;
            margin-bottom: 30px;
            position: relative;
        }
        .way-choose-bank-cell input{
            position: absolute;
            left: 10px;
            top: 40%;
        }
        .way-choose-bank-label{
            height: 100%;
            width: 100%;
            display: flex;
            padding-left: 5px;
            vertical-align: middle;
            justify-content: center;
            align-items: center;
            border: 1px solid #dfdfdf;
            border-radius: 2px;
            box-sizing: border-box;
        }
        .way-choose-bank-cell input[type="radio"]:checked + .way-choose-bank-label{
            border: 2px solid #A4D092;
            border-left-width: 3px;
        }
        .input-bank-cell{
            display: flex;
            padding: 10px 0;
            align-items: center;
        }
        .input-bank-label{
            padding-right: 10px;
        }
        .container .input{
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-variant: tabular-nums;
            list-style: none;
            -webkit-font-feature-settings: 'tnum';
            font-feature-settings: 'tnum';
            position: relative;
            display: inline-block;
            width: 100%;
            height: 32px;
            padding: 4px 11px;
            color: rgba(0,0,0,0.65);
            font-size: 14px;
            line-height: 1.5;
            background-color: #fff;
            background-image: none;
            border: 1px solid #d9d9d9;
            border-radius: 4px;
            -webkit-transition: all .3s;
            transition: all .3s;
        }
        .container .input:hover {
            border-color: #40a9ff;
            border-right-width: 1px !important;
        }
        .btn{
            height: 40px;
            padding: 0 30px;
            font-size: 16px;
            border-radius: 4px;
            color: #fff;
            background-color: rgb(134, 211, 104);
            border-color: rgb(134, 211, 104);
            line-height: 1.499;
            position: relative;
            display: inline-block;
            font-weight: 400;
            white-space: nowrap;
            text-align: center;
            background-image: none;
            border: 1px solid transparent;
            -webkit-box-shadow: 0 2px 0 rgba(0,0,0,0.015);
            box-shadow: 0 2px 0 rgba(0,0,0,0.015);
            cursor: pointer;
            -webkit-transition: all .3s cubic-bezier(.645, .045, .355, 1);
            transition: all .3s cubic-bezier(.645, .045, .355, 1);
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            user-select: none;
            -ms-touch-action: manipulation;
            touch-action: manipulation;
            text-shadow: 0 -1px 0 rgba(0,0,0,0.12);
        }
        .btn:hover{
            color: #fff;
            background-color: #A4D092;
            border-color: #A4D092;
        }
        .way-cell-container{
            display: none;
            width: 100%;
        }
        .way-input{
            display: none;
        }
        input.way-input[type="radio"]:checked + .way-cell {
            box-sizing: border-box;
            border: 2px solid #A4D092;
            border-left-width: 5px;
        }
        input.way-input[type="radio"]:checked + .way-cell > .way-cell-container {
            display: inline-block;
        }
    </style>
</head>
<body>
    <div id="root">
        <div class="wrapper">
            <#--头部-->
            <div class="header">
                <div class="header-top">
                    <div class="logo"></div>
                    <div class="system-name">${name}</div>
                </div>
                <div class="header-bottom">
                    <div class="order-cell">
                        <span class="order-label">订单编号：</span><span class="order-id">${orderNo}</span>
                    </div>
                    <div class="order-cell">
                        <span class="order-label">订单金额：</span><span class="order-amount">￥${orderAmount}</span>
                    </div>
                    <div class="order-cell">
                        <span class="order-label">商品描述：</span><span class="order-desc">${orderDesc}</span>
                    </div>
                </div>
            </div>
            <#--表单部分-->
            <div class="container">
                <form name="deskSubmit" method="post" action="/desk_submit">
                    <input type="hidden" value="${orderNo}" name="orderNo" />
                    <input type="hidden" value="${orderAmount}" name="orderAmount" />
                    <input type="hidden" value="${orderDesc}" name="orderDesc" />
                    <label for="type1">
                        <input class="way-input" value="1" checked type="radio" name="type" id="type1" />
                        <div class="way-cell">
                            <div class="way-cell-title"> 方式一 (选择银行卡)</div>
                            <div class="way-cell-container way-choose-bank">
                            <#list banks as bank >
                                <label class="way-choose-bank-cell" >
                                    <input type="radio" name="bankId" value="${bank.id}" />
                                    <span class="way-choose-bank-label"><img width="100%" height="100%" src="/img/${bank.shortName}.png" alt="${bank.name}(${bank.shortName})"></span>
                                </label>
                            </#list>
                            </div>
                        </div>

                    </label>
                    <label for="type2">
                        <input class="way-input" value="2" type="radio" name="type" id="type2" />
                        <div class="way-cell">
                            <div class="way-cell-title"> 方式二 (输入银行号码)</div>
                            <div class="way-cell-container way-input-bank">
                                <div class="input-bank-cell">
                                    <div class="input-bank-label">银行卡号：</div>
                                    <div class="input-bank-box">
                                        <input class="input" placeholder="请输入银行卡号" type="text" autoComplete="off" name="bankNo" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </label>
                    <div class="container-submit-box">
                        <button type="submit" class="btn">提交</button>
                    </div>
                </form>
            </div>
            <#--页脚-->
            <div class="footer">

            </div>

        </div>

    </div>
<body>
</html>
