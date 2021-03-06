## -*- coding: utf-8 -*-
<!DOCTYPE html SYSTEM "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="application/xhtml+xml;charset=utf-8" />
        <style type="text/css">
            body{
                font-family: arial, verdana, sans-serif;
            }
            div{
                padding:0px;margin:0px;border:0px;overflow:hidden;
            }
            .label_container{
                page-break-inside: avoid;
                width:12.85cm; height:5.2cm; float:left;
            }
            /* Border of the label */
            .label_border{
                margin-left:1.15cm;
                margin-right:1.1cm;
                margin-top:0.35cm;
                margin-bottom:0.35cm;
                padding:0.15cm;
            }
            /* usefull space */
            .label{
                margin-top: 0.25cm;
                margin-bottom: 0.25cm;
                width:10.3cm; height:4.0cm;
                overflow:hidden;
                }
            .label_left{
                width:6.7cm; height:3.3cm; float:left;
                overflow: hidden;
                }
            div.product_name{
                width:6.7cm; height:1.1cm;
                font-size:16px; font-weight:bold;
                overflow: hidden;
                }
            div.product_informations{
                width:6.7cm;height:1.2cm;
                font-size:11px;
                overflow: hidden;
                }
            div.product_labels{
                width:6.7cm; height:1.0cm;
                overflow: hidden;
                }
            div.product_labels_left{
                width:4.2cm; height:1.0cm;
                overflow: hidden; float:left;
            }
            div.product_labels_right{
                font-size:9px;
                width:2.5cm; height:1.0cm;
                overflow: hidden; float:left;
                text-align:center;
            }
            img.product_label{
                width:0.8cm; height:0.8cm; margin:0.1cm;
            }
            div.label_right{
                width:3.6cm; height:3.3cm; float:left;
                overflow: hidden;
            }
            div.product_price{
                margin-top:0.7cm;
                width:3.6cm; height:1.2cm;
                line-height: 1.2cm;
                text-align: center; font-size:30px; font-weight:bold;
                overflow: hidden;
                }
            div.product_price_per_uom{
                margin-top:0.4cm;
                width:3.6cm; height:1.2cm;
                text-align:center; font-size:11px;
                overflow:hidden;
            }
            div.product_price_per_uom_qty{
                width: 1.8cm; height: 1.2cm; float: left;
                overflow: hidden;
            }
            div.product_price_per_uom_price{
                width: 1.8cm; height: 1.2cm; float: left;
                overflow: hidden;
            }
            div.label_bottom{
                width:10.3cm; height:0.7cm;
                overflow:hidden;
            }
            div.label_bottom_left{
                width:6.7cm; height:100%; float:left;
                overflow:hidden;
            }
            div.label_bottom_right{
                margin-top:0.2cm;
                width:3.6cm; height:100%; float:left;
                text-align:center; font-size:9px;
                overflow:hidden;
                font-family:monospace;
            }
            img.ean13_image{
                margin-left:0.05cm;
                width:6.7cm; height:1.0cm;
            }
        </style>
    </head>
    <body>
    %for wizard in objects :
        <!-- Product labels -->
        %for line in wizard.line_ids:
            %for i in range(0,line.quantity):
        <div class="label_container">
                <div class="label_border" style="border: 1px solid;">
                    <div class="label">
                        <div class="label_left">
                            <!-- Product Name -->
                            <div class="product_name" style="background-color:${line.product_id.pricetag_color};">
                            ${line.product_id.name}
                            </div>
                            <!-- Product Information -->
                            <div class="product_informations" style="background-color:${line.product_id.pricetag_color};">
                %if line.product_id.pricetag_origin:
                                ${_('Origin: ')}<b>${line.product_id.pricetag_origin}</b>
                                <br />
                %endif
                %if line.product_id.maker_description:
                                ${_('Maker: ')}<b>${line.product_id.maker_description}</b>
                %endif
                                <br />
                            </div>
                            <!-- Product Label -->
                            <div class="product_labels">
                                <div class="product_labels_left">
                %for label in line.product_id.label_ids:
                                    <img class="product_label" src="data:image/png;base64,${label.image}"/>
                %endfor
                                </div>
                                <!-- Organic warning, if any -->
                                <div class="product_labels_right">
                %if line.product_id.pricetag_organic_text:
                                ${line.product_id.pricetag_organic_text}
                %endif
                                </div>
                            </div>

                        </div>
                        <div class="label_right">
                            <div class="product_price">
                                ${line.product_id.list_price} &#128;
                            </div>
                            <div class="product_price_per_uom">
                                <div class="product_price_per_uom_qty">
                %if line.product_id.volume:
                                    ${_('Volume')}<br /><b>${line.product_id.volume} L</b>
                %elif line.product_id.weight_net:
                                    ${_('Net Weight')}<br /><b>${line.product_id.weight_net} kg</b>
                %endif
                                </div>
                                <div class="product_price_per_uom_price">
                %if line.product_id.volume:
                                    ${_('Price Per Liter')}<br /><b>${line.product_id.price_volume} &#128;</b>
                %elif line.product_id.weight_net:
                                    ${_('Price Per Kilo')}<br /><b>${line.product_id.price_weight_net} &#128;</b>
                %endif
                                </div>
                            </div>
                            
                        </div>
                        <div class="label_bottom">
                            <div class="label_bottom_left">
                %if line.product_id.ean13:
                                <img class="ean13_image" src="data:image/png;base64,${line.product_id.ean13_image}"/>
                %endif
                            </div>
                            <div class="label_bottom_right">
                %if line.product_id.ean13:
                                ${line.product_id.ean13}
                %else:
                                ${line.product_id.code}
                %endif
                            </div>
                        </div>
                    </div>
                </div>
        </div>
            %endfor
        %endfor
    %endfor
    </body>
</html>


