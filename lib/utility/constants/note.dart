/* Stack(
            children: [
              Container(
                height: height * .26,
                width: width * .40,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(.1),
                        blurRadius: 2,
                        spreadRadius: 3,
                        offset: const Offset(0, 2))
                  ],
                  color: AppColors.lightBackground,
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              Container(
                height: height * .17,
                width: width * .39,
                decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: NetworkImage(
                            'https://student.valuxapps.com/storage/uploads/products/1615440322npwmU.71DVgBTdyLL._SL1500_.jpg'),
                        fit: BoxFit.fill),
                    color: Colors.grey.withOpacity(.1),
                    borderRadius: BorderRadius.circular(16)),
              ),
              Positioned(
                top: 16,
                left: 2,
                child: Container(
                  height: 20,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppColors.secondary.withOpacity(.8),
                  ),
                  child: const Text(
                    '25\$',
                    style: TextStyle(color: Colors.black, fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Positioned(
                top: 140,
                child: SizedBox(
                  height: height * .9,
                  width: width * .40,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: width * .25,
                            child: const Padding(
                              padding: EdgeInsets.only(left: 5),
                              child: Text(
                                  'تليفزيون سمارت 65 بوصة 4K الترا اتش دي منحني من سامسونج UA65RU7300RXUM',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ),
                          IconButton(
                              icon: const Icon(Icons.favorite),
                              color: Colors.red,
                              iconSize: 23,
                              onPressed: () {
                                setState(() {});
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text("\$ ${599} ",
                                style: TextStyle(
                                    color: AppColors.kPrimaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          InkWell(
                            highlightColor: Colors.red,
                            radius: 500,
                            onTap: () {},
                            child: Container(
                              height: 34,
                              width: 34,
                              margin:
                                  const EdgeInsets.only(left: 16, right: 8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: AppColors.kLightColor),
                              child: const Icon(
                                Icons.shopping_cart_outlined,
                                size: 25,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),*/
