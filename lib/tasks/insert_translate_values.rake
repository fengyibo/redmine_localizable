namespace :localizable do
    namespace :import do  
        task :localize_rules => :environment do
            @plugin = Redmine::Plugin.find("localizable")
            # 72 é a linha da tabela Settings onde fica armazenado todos os settings de localize
            settings = Setting.find(72).value
            possible_values = settings[:locales][:possible_values]
            changed_values = [{"Embalagem"=>{en:"Packing",es:"embalaje"}},
                {"Entrega"=>{en:"Delivery",es:"entrega"}},
                {"Entrega"=>{en:"Delivery",es:"entrega"}},
                {"Qualidade"=>{en:"Quality",es:"calidad"}},
                {"Abaulamento baixo"=>{en:"Low erase",es:"Buzón bajo"}},
                {"Arrancamentos de metal"=>{en:"Metal inserts",es:"Arrancados de metal"}},
                {"Avaria material de embalagem"=>{en:"Breakdown of packaging material",es:"Avería material de embalaje"}},
                {"Avarias no transporte"=>{en:"Breakdowns in transport",es:"Averías en el transporte"}},
                {"Baixa resistência do metal"=>{en:"Low metal resistance",es:"Baja resistencia del metal"}},
                {"Blush"=>{en:"Blush",es:"rubor"}},
                {"Bobina trocada"=>{en:"Replaced Coil",es:"Bobina cambiada"}},
                {"Causas diversas na refiladeira"=>{en:"Different causes in the reformer",es:"Causas diversas en la refiladora"}},
                {"Coil ser invertido"=>{en:"Coil to be inverted",es:"Coil se invierte"}},
                {"Danos mecânicos no metal"=>{en:"Mechanical damage to metal",es:"Daños mecánicos en el metal"}},
                {"Defeitos mecânicos  (incrustações / resíduos)"=>{en:"Mechanical defects (inlays / residues)",es:"Defectos mecánicos (incrustaciones / residuos)"}},
                {"Defeitos mecânicos laminados (leves)"=>{en:"Mechanical defects laminated (light)",es:"Defectos mecánicos laminados (ligeros)"}},
                {"Desfolhamento"=>{en:"Defoliation",es:"defoliación"}},
                {"Earing elevado"=>{en:"High Earing",es:"Earing alto"}},
                {"Embolamento de lamina no tab die"=>{en:"Lamina Embolamento no tab die",es:"Embolamiento de lamina en el tab die"}},
                {"Embolamento Pet Free"=>{en:"Pet Free Embolamento",es:"Embarcación Pet Libre"}},
                {"Espessura baixa"=>{en:"Low Thickness",es:"Espesor bajo"}},
                {"Espessura fora do especificado"=>{en:"Thickness outside specified",es:"Espesor fuera de lo especificado"}},
                {"Espula colapsada"=>{en:"Collapsed Spine",es:"Espula colapsada"}},
                {"Espula corrida"=>{en:"Running Spike",es:"Espina carrera"}},
                {"Excesso de lubrificante no metal CES"=>{en:"Excessive lubrication in metal CES",es:"Exceso de lubricante en el metal CES"}},
                {"Falha na embalagem"=>{en:"Packing failure",es:"Fallo en el embalaje"}},
                {"Falha na Identificação da Bobina"=>{en:"Coil Identification Failure",es:"Fallo en la identificación de la bobina"}},
                {"Falha no bobinamento"=>{en:"Winding failure",es:"Falla en el bobinado"}},
                {"Formabilidade"=>{en:"Formability",es:"conformabilidad"}},
                {"Inclusão do dip tube"=>{en:"Inclusion of the dip tube",es:"Inclusión del dip tube"}},
                {"Inclusões"=>{en:"Inclusions",es:"inclusiones"}},
                {"Inclusões no metal"=>{en:"Inclusions in metal",es:"Inclusiones en el metal"}},
                {"Incrustação de partículas metálicas"=>{en:"Embedding of metallic particles",es:"Incrustación de partículas metálicas"}},
                {"Incrustação Silica"=>{en:"Silicone Inlay",es:"Incrustación Silica"}},
                {"Incrustações metálicas"=>{en:"Metal inlays",es:"Incrustaciones metálicas"}},
                {"Largura fora"=>{en:"Width outside",es:"Ancho fuera"}},
                {"Lata riscada"=>{en:"Can scratched",es:"Lata rayada"}},
                {"Mancha branca"=>{en:"White spot",es:"Mancha blanca"}},
                {"Mancha dágua"=>{en:"Water stain",es:"Mancha de agua"}},
                {"Mancha de coolant"=>{en:"Coolant stain",es:"Mancha de coolant"}},
                {"Mancha no verniz"=>{en:"Stain on varnish",es:"Mancha en el barniz"}},
                {"Manchas de Bytelube / Coolant"=>{en:"Bytelube / Coolant stains",es:"Manchas de Bytelube / Coolant"}},
                {"Marca de calço"=>{en:"Chock mark",es:"Marca de calzado"}},
                {"Marca de cavaco"=>{en:"Chip brand",es:"Marca de viruta"}},
                {"Marca de cilindro"=>{en:"Cylinder mark",es:"Marca de cilindro"}},
                {"Marca de faca"=>{en:"Knife mark",es:"Marca de cuchillo"}},
                {"Material não solicitado"=>{en:"Unsolicited material",es:"Material no solicitado"}},
                {"Meia  lata"=>{en:"Half can",es:"Medias lata"}},
                {"Outras causas diversas na refusão"=>{en:"Other miscellaneous causes in the reflow",es:"Otras causas diversas en la refusión"}},
                {"OUTROS"=>{en:"OTHERS",es:"OTRAS"}},
                {"Planicidade fora do especificado"=>{en:"Out-of-specification flatness",es:"Planificación fuera de lo especificado"}},
                {"Post lube fora do especificado"=>{en:"Post lube out of specification",es:"Post lube fuera de lo especificado"}},
                {"Postlube (falta ou degradação)"=>{en:"Postlube (lack or degradation)",es:"Postlub (falta o degradación)"}},
                {"Presença de inclusões no metal (defeito do CES)"=>{en:"Presence of inclusions in the metal (defect of the CES)",es:"Presencia de inclusión en el metal (defecto del CES)"}},
                {"Problema no metal"=>{en:"Metal problem",es:"Problema en el metal"}},
                {"Propriedades mecânicas (anisotropia)"=>{en:"Mechanical properties (anisotropy)",es:"Propiedades mecánicas (anisotropía)"}},
                {"Propriedades mecânicas fora do especificado"=>{en:"Mechanical properties not specified",es:"Propiedades mecánicas fuera de lo especificado"}},
                {"Rebarbas de corte"=>{en:"Cutting burrs",es:"Rebabas de corte"}},
                {"Rebarbas na lateral da lâmina"=>{en:"Burrs on the side of the blade",es:"Rebarbas en el lateral de la hoja"}},
                {"Rejeição por pressco"=>{en:"Rejection by pressure",es:"Rechazo por presco"}},
                {"Resíduo de rolete"=>{en:"Roller residue",es:"Residuo de rodillo"}},
                {"Resíduo superficial"=>{en:"Surface residue",es:"Residuos superficiales"}},
                {"Risco preto"=>{en:"Black risk",es:"Riesgo negro"}},
                {"Risco superficial"=>{en:"Superficial risk",es:"Riesgo superficial"}},
                {"Rugosidade"=>{en:"Roughness",es:"aspereza"}},
                {"Sucata na linha da refiladeira"=>{en:"Scrap in the line of the reformer",es:"Chatarra en la línea de la refiladora"}},
                {"Variação de Espessura"=>{en:"Thickness Variation",es:"Variación de espesor"}},
                {"Variação de largura"=>{en:"Width variation",es:"Variación de ancho"}},
                {"Atendimento"=>{en:"Attendance",es:"tratamiento"}},
                {"Atendimento - MD"=>{en:"Customer Service - MD",es:"Atención al cliente - MD"}},
                {"Documentação"=>{en:"Documentation",es:"documentación"}},
                {"Embalagem"=>{en:"Packing",es:"embalaje"}},
                {"Embalagem - MD"=>{en:"Packaging - MD",es:"Embalaje - MD"}},
                {"Entrega"=>{en:"Delivery",es:"entrega"}},
                {"Entrega - MD"=>{en:"Delivery - MD",es:"Entrega - MD"}},
                {"Faturamento"=>{en:"Revenues",es:"facturación"}},
                {"Faturamento - MD"=>{en:"Billing - MD",es:"Facturación - MD"}},
                {"Faturamento - MI"=>{en:"Billing - MI",es:"Facturación - MI"}},
                {"Gestão e Escopo do Trabalho"=>{en:"Management and Scope of Work",es:"Gestión y Alcance del Trabajo"}},
                {"Material"=>{en:"Material",es:"material"}},
                {"Material - MD"=>{en:"Material - MD",es:"Material - MD"}},
                {"Meio-ambiente"=>{en:"Environment",es:"Medio ambiente"}},
                {"Máquinas/Equipamentos"=>{en:"Machinery / Equipment",es:"Maquinaria / Equipos"}},
                {"Operação Logística - Transporte"=>{en:"Logistics Operation - Transportation",es:"Operación Logística - Transporte"}},
                {"Pessoal"=>{en:"Folks",es:"personal"}},
                {"Qualidade"=>{en:"Quality",es:"calidad"}},
                {"Qualidade do Produto"=>{en:"Product quality",es:"Calidad del producto"}},
                {"Qualidade do Produto - MD"=>{en:"Product Quality - MD",es:"Calidad del producto - MD"}},
                {"Qualidade do serviço"=>{en:"Service quality",es:"Calidad del servicio"}},
                {"Qualidade do serviço - transportadoras"=>{en:"Quality of service - carriers",es:"Calidad del servicio - transportistas"}},
                {"Qualidade do serviço - transportadoras - MI"=>{en:"Quality of service - carriers - MI",es:"Calidad del servicio - transportistas - MI"}},
                {"Segurança do Trabalho"=>{en:"Workplace safety",es:"Seguridad del trabajo"}},
                {"N/D"=>{en:"N / A",es:"N / A"}},
                {"Nenhuma"=>{en:"None",es:"no"}},
                {"Baixa"=>{en:"Low",es:"bajo"}},
                {"Média"=>{en:"Average",es:"promedio"}},
                {"Alta"=>{en:"High",es:"alto"}},
                {"Urgente"=>{en:"Urgent",es:"urgente"}},
                {"Abrasão"=>{en:"Abrasion",es:"abrasión"}},
                {"Aliquota de Imposto errado"=>{en:"Wrong Tax Aliquot",es:"Aliquota de Impuesto incorrecto"}},
                {"Apodrecimento na madeira"=>{en:"Rotting on wood",es:"Apodado en la madera"}},
                {"Arranhão do ferramental"=>{en:"Tooling Scratch",es:"Rueda de herramientas"}},
                {"Atraso de pessoal"=>{en:"Delay of personnel",es:"Retraso de personal"}},
                {"Atraso na entrega"=>{en:"Delivery delay",es:"Atraso en la entrega"}},
                {"Atraso na entrega da fatura"=>{en:"Delay in invoice delivery",es:"Retraso en la entrega de la factura"}},
                {"Avaria de trajeto"=>{en:"Route malfunction",es:"Avería de trayecto"}},
                {"Avaria do Produto na Movimentação"=>{en:"Product malfunction in the handling",es:"Avería del producto en la impulsión"}},
                {"Avaria do Produto no Carregamento"=>{en:"Product Failure on Load",es:"Avería del producto en el cargamento"}},
                {"Avaria no Produto durante o trajeto"=>{en:"Product malfunction during transit",es:"Avería en el producto durante el trayecto"}},
                {"Baixa humidade na madeira"=>{en:"Low humidity on wood",es:"Baja humedad en la madera"}},
                {"Carga avariada"=>{en:"Faulty load",es:"Carga averiada"}},
                {"Carga molhada"=>{en:"Wet load",es:"Carga mojada"}},
                {"Ciclo papel filtro"=>{en:"Filter Paper Cycle",es:"Ciclo de papel de filtro"}},
                {"Consumo elevado"=>{en:"High consumption",es:"Consumo elevado"}},
                {"Consumo elevado de ferramental"=>{en:"High tool consumption",es:"Consumo elevado de herramientas"}},
                {"Demora no atendimento"=>{en:"Delay in service",es:"Demora en la atención"}},
                {"Desatualização da documentação"=>{en:"Documentation deduplication",es:"Desfasaje de la documentación"}},
                {"Divergencia de quantidade de volumes"=>{en:"Volume quantity divergence",es:"Divergencia de cantidad de volúmenes"}},
                {"Divergência de Valor"=>{en:"Divergence of Value",es:"Divergencia de Valor"}},
                {"Divergência de condições (prazo, quantidade, impostos e etc)"=>{en:"Divergence of conditions (term, quantity, taxes and etc.)",es:"Divergencia de condiciones (plazo, cantidad, impuestos y etc)"}},
                {"Divergência de peso"=>{en:"Weight divergence",es:"Divergencia de peso"}},
                {"Embalagem Danificada"=>{en:"Damaged package",es:"Embalaje dañado"}},
                {"Embalagem com Informações Incompletas"=>{en:"Packing with Incomplete Information",es:"Embalaje con Información Incompleta"}},
                {"Embalagem não conforme"=>{en:"Non-compliant packaging",es:"Embalaje no conforme"}},
                {"Embolamento de lâmina"=>{en:"Blade Emblaziation",es:"Embarcación de lámina"}},
                {"Emissão de documento fiscal com divergência"=>{en:"Issuance of tax document with divergence",es:"Emisión de documento fiscal con divergencia"}},
                {"Entrega Antecipada"=>{en:"Early Delivery",es:"Entrega anticipada"}},
                {"Entrega Atrasada"=>{en:"Late delivery",es:"Entrega retrasada"}},
                {"Entrega Incompleta"=>{en:"Incomplete Delivery",es:"Entrega Incompleta"}},
                {"Entrega em Destinatário incorreto"=>{en:"Incorrect recipient delivery",es:"Entrega en destinatario incorrecto"}},
                {"Entrega em Excesso"=>{en:"Excess Delivery",es:"Entrega en Exceso"}},
                {"Excesso de fiapos, lascas"=>{en:"Excess lint, splinters",es:"Exceso de pelusas, astillas"}},
                {"Excesso de po"=>{en:"Excess of po",es:"Exceso de po"}},
                {"Excesso de tratamento"=>{en:"Excessive treatment",es:"Exceso de tratamiento"}},
                {"Extravio de Documentação"=>{en:"Lost Documentation",es:"Extracto de documentación"}},
                {"Falha de adesão"=>{en:"Failure to join",es:"Falla de adhesión"}},
                {"Falha na decoração"=>{en:"Decoration failure",es:"Falla en la decoración"}},
                {"Falha no acabamento superficial"=>{en:"Surface finish failure",es:"Falla en el acabado superficial"}},
                {"Falhas na execução dos serviços contratados"=>{en:"Failure to execute contracted services",es:"Fallas en la ejecución de los servicios contratados"}},
                {"Falta apresentação de documentação de Pessoal"=>{en:"Lack of documentation of personnel",es:"Falta presentación de documentación de personal"}},
                {"Falta apresentação do pedido de compra"=>{en:"Missing purchase order submission",es:"Falta de presentación de la solicitud de compra"}},
                {"Falta de Certificado"=>{en:"Lack of Certificate",es:"Falta de certificado"}},
                {"Falta de Integração de Segurança de Trabalho Pessoal"=>{en:"Lack of Personal Work Security Integration",es:"Falta de Integración de Seguridad de Trabajo Personal"}},
                {"Falta de Material de limpeza/ descartável"=>{en:"Lack of cleaning / disposable material",es:"Falta de material de limpieza / desechable"}},
                {"Falta de Produto"=>{en:"Lack of product",es:"Falta de producto"}},
                {"Falta de Supervisão Direta de todos os serviços"=>{en:"Lack of Direct Supervision of all services",es:"Falta de supervisión directa de todos los servicios"}},
                {"Falta de apresentação de Plano de Trabalho da equipe"=>{en:"Failure to present Team Work Plan",es:"Falta de presentación de Plan de Trabajo del equipo"}},
                {"Falta de apresentação de documentação da empresa"=>{en:"Failure to present company documentation",es:"Falta de presentación de documentación de la empresa"}},
                {"Falta de conhecimento/ treinamento sobre Meio-Ambiente"=>{en:"Lack of knowledge / training on the Environment",es:"Falta de conocimiento / entrenamiento sobre Medio Ambiente"}},
                {"Falta de controle dos produtos químicos utilizados"=>{en:"Lack of control of chemicals used",es:"Falta de control de los productos químicos utilizados"}},
                {"Falta de controle dos produtos utilizados"=>{en:"Lack of control of the products used",es:"Falta de control de los productos utilizados"}},
                {"Falta de documentação de acomp. de NF ref. aos recolhimentos mensais"=>{en:"Lack of accompanying documentation of NF ref. monthly payments",es:"Falta de documentación de acomp. de NF ref. a los recogidos mensuales"}},
                {"Falta de documentação de pessoal ou da empresa"=>{en:"Lack of personnel or company documentation",es:"Falta de documentación de personal o de la empresa"}},
                {"Falta de limpeza e conservação das áreas de trabalho"=>{en:"Lack of cleaning and conservation of work areas",es:"Falta de limpieza y conservación de las áreas de trabajo"}},
                {"Falta de material de limpeza/ descartável"=>{en:"Lack of cleaning / disposable material",es:"Falta de material de limpieza / desechable"}},
                {"Falta de pessoal"=>{en:"Lack of staff",es:"Falta de personal"}},
                {"Falta de retorno de solicitações"=>{en:"Failure to return requests",es:"Falta de devolución de solicitudes"}},
                {"Falta de retorno ou erro, Rastreamento e Status de Frota"=>{en:"Lack of return or error, Tracking and Fleet Status",es:"Falta de retorno o error, Rastreo y estado de flota"}},
                {"Falta de retorno, demora ou não atendimento de solicitações"=>{en:"Lack of return, delay or non-fulfillment of requests",es:"Falta de retorno, demora o no atención de solicitudes"}},
                {"Falta de tensão"=>{en:"Lack of tension",es:"Falta de tensión"}},
                {"Falta de utilização ou asseio com EPIs, Crachás ou Uniformes"=>{en:"Lack of use or cleanliness with PPE, Badges or Uniforms",es:"Falta de uso o aseo con EPIs, Botones o Uniformes"}},
                {"Falta ou atraso de pessoal"=>{en:"Lack or delay staff",es:"Falta o retraso de personal"}},
                {"Fatura com divergência em relação ao Pedido de compra"=>{en:"Invoice with divergence from Purchase Order",es:"Factura con divergencia respecto al Pedido de compra"}},
                {"Funcionários não devidamente uniformizados (camisa da empresa e crachá)"=>{en:"Employees not properly uniformed (company shirt and badge)",es:"Funcionarios no debidamente uniformados (camisa de la empresa y credencial)"}},
                {"Funcionários não devidamente uniformizados / com EPI"=>{en:"Employees not properly uniformed / with PPE",es:"Funcionarios no adecuadamente uniformados / con EPI"}},
                {"Indisponibilidade (defeitos) de Máquinas, Equipamentos e Materiais"=>{en:"Unavailability (defects) of Machines, Equipment and Materials",es:"Indisponibilidad (defectos) de máquinas, equipos y materiales"}},
                {"Indisponibilidade ou defeito de máquinas, equipamentos ou materiais"=>{en:"Unavailability or defect of machines, equipment or materials",es:"Indisponibilidad o defecto de máquinas, equipos o materiales"}},
                {"Lote infestado com pragas"=>{en:"Pest infested lot",es:"Lote infestado con plagas"}},
                {"Madeira úmida"=>{en:"Wet Wood",es:"Madera húmeda"}},
                {"Marca Divergente do Solicitado"=>{en:"Divergent Mark of Requested",es:"Marca divergente del solicitado"}},
                {"Material Errado"=>{en:"Wrong Material",es:"Material incorrecto"}},
                {"Material Fora da Especificação"=>{en:"Non-Specification Material",es:"Material fuera de la especificación"}},
                {"Meia lata"=>{en:"Half can",es:"Medias lata"}},
                {"Metal Exposto"=>{en:"Metal Exposed",es:"Metal Exposto"}},
                {"Mistura de Produtos na Rua"=>{en:"Mixing Products on the Street",es:"Mezcla de productos en la calle"}},
                {"Mofo"=>{en:"Mold",es:"molde"}},
                {"Motorista não se comportou adequadamente/não seguiu os procedimentos da fábrica"=>{en:"Driver did not behave properly / did not follow factory procedures",es:"El conductor no se comportó adecuadamente / no siguió los procedimientos de la fábrica"}},
                {"Má conduta do motorista"=>{en:"Driver misconduct",es:"Mala conducta del conductor"}},
                {"Numero do Pedido não informado na DANFE"=>{en:"Order number not informed by DANFE",es:"Número de pedido no informado en DANFE"}},
                {"Não Cumprimento de Procedimentos"=>{en:"Non-Compliance with Procedures",es:"No Cumplimiento de Procedimientos"}},
                {"Não Cumprimento do Cronograma dos serviços"=>{en:"Non-compliance with the Services Schedule",es:"No Cumplimiento del cronograma de los servicios"}},
                {"Não apresentação de relatórios mensais dos serviços realizados"=>{en:"Non-submission of monthly reports of services performed",es:"No presentación de informes mensuales de los servicios realizados"}},
                {"Não apresentação de&nbsp; Máquinas, Equipamentos e Materiais"=>{en:"No submission of & nbsp; Machinery, Equipment and Materials",es:"No presentación de & nbsp; Máquinas, Equipos y Materiales"}},
                {"Não apresentação do plano de trabalho do pessoal ou relatório mensal dos serviços"=>{en:"Failure to submit staff work plan or monthly services report",es:"No presentación del plan de trabajo del personal o informe mensual de los servicios"}},
                {"Não atendimento de solicitações"=>{en:"Non-fulfillment of requests",es:"No atender solicitudes"}},
                {"Não cumprimento do cronograma dos serviços"=>{en:"Non-compliance with the services schedule",es:"No cumplimiento del cronograma de los servicios"}},
                {"Não cumprimento do escopo do Contrato"=>{en:"Failure to comply with the scope of the Contract",es:"No cumplimiento del alcance del Contrato"}},
                {"Não disponibilização (atraso) de recursos (pessoal ou veículos)"=>{en:"Non-availability (delay) of resources (staff or vehicles)",es:"No disponible (retraso) de recursos (personal o vehículos)"}},
                {"Não disponibilização de recursos (pessoal ou veículos)"=>{en:"Non-availability of resources (staff or vehicles)",es:"No disponer de recursos (personal o vehículos)"}},
                {"Não disponibilização do veículo de acordo com as especificações da Rexam"=>{en:"Non-availability of the vehicle according to Rexams specifications",es:"No disponer del vehículo de acuerdo con las especificaciones de Rexam"}},
                {"Não utilização de equipamento de segurança"=>{en:"Non-use of safety equipment",es:"No utilizar equipo de seguridad"}},
                {"Não utilização de equipamento de segurança (bota)"=>{en:"No use of safety equipment (boot)",es:"No utilizar equipo de seguridad (bota)"}},
                {"OUTRO (OBRIGATÓRIO ESPECIFICAR O DEFEITO)"=>{en:"OTHER (MANDATORY SPECIFYING DEFECT)",es:"OTRO (OBLIGATORIO ESPECIFICAR EL DEFECTO)"}},
                {"Ocorrência ambiental (vazamento, fumaça negra, contaminação, desmatamento)"=>{en:"Environmental occurrence (leakage, black smoke, contamination, deforestation)",es:"Ocurrencia ambiental (fuga, humo negro, contaminación, deforestación)"}},
                {"Ocorrência de condições inseguras"=>{en:"Occurrence of unsafe conditions",es:"Ocurrencia de condiciones inseguras"}},
                {"Ocorrências de Acidentes de Trabalho"=>{en:"Accidents of Work Accidents",es:"Ocurrencias de accidentes de trabajo"}},
                {"Odores"=>{en:"Odors",es:"olores"}},
                {"Operação / descarte indevido de produtos/ resíduos"=>{en:"Incorrect operation / disposal of products / waste",es:"Operación / descarte indebido de productos / residuos"}},
                {"P/N errado"=>{en:"Wrong Wrong",es:"P / N incorrecto"}},
                {"Pragas, cupim, brocas"=>{en:"Pest, termite, drills",es:"Plagas, termitas, brocas"}},
                {"Pregos expostos"=>{en:"Exposed nails",es:"Clavos expuestos"}},
                {"Presença de bolhas"=>{en:"Presence of bubbles",es:"Presencia de burbujas"}},
                {"Preço Bruto errado"=>{en:"Wrong Gross Price",es:"Precio Bruto incorrecto"}},
                {"Preço liquido errado"=>{en:"Wrong net price",es:"Precio neto incorrecto"}},
                {"Problema de aplicação"=>{en:"Application problem",es:"Problema de aplicación"}},
                {"Problema de impressão"=>{en:"Printing problem",es:"Problema de impresión"}},
                {"Problema de postura profissional"=>{en:"Professional posture problem",es:"Problema de postura profesional"}},
                {"Problema de relacionamento"=>{en:"Relationship problem",es:"Problema de relación"}},
                {"Problemas com EPI´s – Falta de Apresentação e Asseio com: EPI´s, Crachás e Utilização de Uniformes"=>{en:"Problems with EPIs - Lack of Presentation and Saw with: EPIs, Badges and Uniforms",es:"Problemas con EPIs - Falta de Presentación y Asimiento con: EPIs, Botones y Uso de Uniformes"}},
                {"Problemas com documentação do veículo"=>{en:"Problems with vehicle documentation",es:"Problemas con la documentación del vehículo"}},
                {"Problemas de relacionamento ou postura profissional"=>{en:"Relationship problems or professional posture",es:"Problemas de relación o postura profesional"}},
                {"Produto Danificado"=>{en:"Damaged product",es:"Producto dañado"}},
                {"Produto fora de especificação"=>{en:"Product out of specification",es:"Producto fuera de especificación"}},
                {"Quantidade Errada"=>{en:"Wrong Quantity",es:"Cantidad incorrecta"}},
                {"Rachadura na madeira"=>{en:"Crack in wood",es:"Rachadura en la madera"}},
                {"Respingo"=>{en:"Splash",es:"chapoteo"}},
                {"Ripas soltas"=>{en:"Loose slats",es:"Ripas sueltas"}},
                {"Saco descolando na lateral"=>{en:"Bag taking off on the side",es:"Bolso que despega en el lateral"}},
                {"Saco descolando no fundo"=>{en:"Bag taking off in the background",es:"Bolso que despega en el fondo"}},
                {"Saco rasgando"=>{en:"Ripping bag",es:"Bolso que rasga"}},
                {"Saco úmido"=>{en:"Wet bag",es:"Bolsa húmeda"}},
                {"Sacos colados no fundo"=>{en:"Bags glued to the bottom",es:"Bolsos en el fondo"}},
                {"Sacos com a lateral colada"=>{en:"Bags with the side glued",es:"Sacos con el lateral pegado"}},
                {"Sacos com cola no meio"=>{en:"Bags with glue in the middle",es:"Bolsas con pegamento en el medio"}},
                {"Sacos cortados"=>{en:"Sliced ​​bags",es:"Sacos cortados"}},
                {"Sujidades"=>{en:"Filth",es:"suciedad"}},
                {"Tinta Dura"=>{en:"Hard Ink",es:"Tinta Dura"}},
                {"Tinta soltando"=>{en:"Dropping ink",es:"Tinta suelta"}},
                {"Tonalidade fora do padrão"=>{en:"Non-standard hue",es:"Tonalidad fuera del estándar"}},
                {"Trip"=>{en:"Trip",es:"viaje"}},
                {"Utilização de produtos de baixa qualidade"=>{en:"Use of poor quality products",es:"Uso de productos de baja calidad"}},
                {"Variação de largura"=>{en:"Width variation",es:"Variación de ancho"}},
                {"Variação dimensional"=>{en:"Dimensional variation",es:"Variación dimensional"}},
                {"Variação do lábio"=>{en:"Lip change",es:"Variación del labio"}},
                {"Variação na gramatura"=>{en:"Variation in weight",es:"Variación en el peso"}},
                {"Variação no comprimento"=>{en:"Variation in length",es:"Variación en longitud"}},
                {"Veículos em mau estado de conservação"=>{en:"Vehicles in poor condition",es:"Vehículos en mal estado de conservación"}},
                {"Violação das regras de EHS"=>{en:"Violation of EHS rules",es:"Violación de las normas de EHS"}},
                {"Violação das regras de EHS (de acordo com Diretrizes de EHS)"=>{en:"Violation of EHS rules (according to EHS Guidelines)",es:"Violación de las reglas de EHS (de acuerdo con las Directrices de EHS)"}},
                {"Procedente"=>{en:"From",es:"derivado"}},
                {"Procedente Alerta"=>{en:"Coming Alert",es:"Procedente Alerta"}},
                {"Não Procedente"=>{en:"Not applicable",es:"No Procedente"}},
                {"Duplicada"=>{en:"Duplicated",es:"duplicar"}},
                {"Agua e Esgoto"=>{en:"Water and sewage",es:"Agua y Alcantarillado"}},
                {"Alimentação"=>{en:"food",es:"comida"}},
                {"Benefícios"=>{en:"Benefits",es:"beneficios"}},
                {"Conservação e Limpeza"=>{en:"Conservation and Cleaning",es:"Conservación y Limpieza"}},
                {"Catálogo Eletrônico"=>{en:"Electronic Catalog",es:"Catálogo Electrónico"}},
                {"Consultoria / Assessoria"=>{en:"Consulting / Advisory",es:"Consultoría / Asesoría"}},
                {"Contratos de Temporários"=>{en:"Temporary Agreements",es:"Contratos de Temporales"}},
                {"Controle de Pragas"=>{en:"Pest control",es:"Control de plagas"}},
                {"Criação de Arte de Rótulos"=>{en:"Creating Label Art",es:"Creación de arte de etiquetas"}},
                {"Energia Elétrica"=>{en:"Electricity",es:"Energia electrica"}},
                {"Gás"=>{en:"Gas",es:"gas"}},
                {"Gerenciamento Resíduos"=>{en:"Waste Management",es:"Gestión de Residuos"}},
                {"Locação Copiadora/Impressora"=>{en:"Copier / Printer Rental",es:"Alquiler Copiadora / Impresora"}},
                {"Locação de Toalhas Industriais"=>{en:"Rental of Industrial Towels",es:"Alquiler de Toallas Industriales"}},
                {"Locação de Imóveis"=>{en:"Real Estate Rental",es:"Alquiler de Inmuebles"}},
                {"Locação de Veículos"=>{en:"Vehicle Rental",es:"Alquiler de Vehículos"}},
                {"Manutenção Operacional Diversos"=>{en:"Other Operational Maintenance",es:"Mantenimiento Operativo Varios"}},
                {"Medicina Ocupacional"=>{en:"occupational medicine",es:"Medicina Ocupacional"}},
                {"Movimentação de Cargas"=>{en:"Cargo Handling",es:"Movimiento de cargas"}},
                {"Outros Serviços"=>{en:"Other services",es:"Otros servicios"}},
                {"Inspeção e Acondicionamento"=>{en:"Inspection and Packaging",es:"Inspección y Acondicionamiento"}},
                {"Projeto On Site"=>{en:"On Site Project",es:"Proyecto en el sitio"}},
                {"Serviços de Informática"=>{en:"Computer Services",es:"Servicios de Informática"}},
                {"Telecomunicações"=>{en:"Telecommunications",es:"telecomunicaciones"}},
                {"Transporte de Funcionários"=>{en:"Employee Transport",es:"Transporte de Empleados"}},
                {"Segurança Patrimonial"=>{en:"Property security",es:"Seguridad patrimonial"}},
                {"Viagens"=>{en:"Travels",es:"de viaje"}},
                {"Entrega de Documentos"=>{en:"Documents delivery",es:"Entrega de documentos"}},
                {"Água"=>{en:"Water",es:"agua"}},
                {"Composto Selante"=>{en:"Composite Sealant",es:"Compuesto Sellante"}},
                {"Energia"=>{en:"Energy",es:"poder"}},
                {"Food Grade"=>{en:"Food Grade",es:"Food Grade"}},
                {"Gás"=>{en:"Gas",es:"gas"}},
                {"Graxas e Lubrificantes"=>{en:"Greases and Lubricants",es:"Grapas y Lubricantes"}},
                {"Packaging"=>{en:"Packaging",es:"embalaje"}},
                {"Químicos e lubrificantes de alta performance"=>{en:"High Performance Chemicals and Lubricants",es:"Químicos y lubricantes de alto rendimiento"}},
                {"Tab Lube"=>{en:"Tab Lube",es:"Tab Lube"}},
                {"Tintas"=>{en:"Paints",es:"pinturas"}},
                {"Verniz Externo"=>{en:"Exterior Varnish",es:"Barniz Externo"}},
                {"Verniz Interno"=>{en:"Inner Varnish",es:"Barniz Interno"}},
                {"Devolução"=>{en:"Devolution",es:"devolución"}},
                {"Ressarcimento"=>{en:"Refund",es:"reembolso"}},
                {"Procedente"=>{en:"From",es:"derivado"}},
                {"Não Procedente"=>{en:"Not applicable",es:"No Procedente"}},
                {"Duplicada"=>{en:"Duplicated",es:"duplicar"}}
                ]

            changed_values.each do |value|
                possible_values[value.keys.first] = value[value.keys.first]
            end

            settings[:locales][:possible_values] = possible_values

            Setting.send "plugin_#{@plugin.id}=", settings
        end
    end
end