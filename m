Return-Path: <abayiz@yahoo.com>
Received: from sonic309-47.consmr.mail.ne1.yahoo.com
	(sonic309-47.consmr.mail.ne1.yahoo.com [66.163.184.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9404B71B86
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
	t=1495008107; bh=hKvBGm1BbyRMMQk9B+OzIgZj4WoKilpRElhOg4Edcho=;
	h=Date:From:Reply-To:To:Subject:References:From:Subject;
	b=Kkmh/19OfUS7UL3ebHVPw1v9JQ5VokKn+Hj0teIighwHeWhVL3jVj51tfEj1IGOOjJ/1NxLTlkDM2BuKpmRKhWMil45ah8Pmo8l5f1jpXwa/m0POQG505xWKiDVF81zJsMnttcgRu4LNIJLrTp0wzXyzhQcaFjUg3Rl4DhhnBTHY92M8/3Z/8RaGW4u/tClpqUA7n+LqezMZPZrWd9e/SQBu6dDkS8OFuaLo2P8DFFbmN3zYZneWaSViimjxK9MNPswwBezL0yQbdzQZ8MSWw70EmxVe1vLJ+/8cBI/RBKdoj9Lh97+F3i2SKlrTPwqTNSoZZevT0AYl4jH8+hQdOg==
X-YMail-OSG: EjD25G4VM1mwaL3Qx1oV0Uxxwg8bDb4Jz3Rf5WpYCh7kaLbnE_Jz.7rfk29CGLb
	Lk6U5xoo40WO7Ya4r1ZnzQC6dewedpO0HnBgQWyXQEwkP5.68njSc1_OuydVuisAa0ESibng.jD3
	WID2roI.t9iMVy_WQGAOyCNI95do7wvJpjIhf25Zj3wFW1dLqdz87ep75K1W8dGZ.PHuK5ZRm.9a
	TN8dXiDBArly4uI8sf16SgbuZdbff0ps8iLVTvwRjAo4MYHF9J2Dqmbxn7wsAwJq1vmSkiaRmSbb
	r6Zmg6CbkUOlK0P4CPgpZ38JBpwymBlTsnNOUoxs4pxOZfGegJBGlhkGU2pIEGWjTeadMzAqkvu8
	SOF7V_KOwRgaWp.7UbcHbLcCFBv1qqPiP0rV6U21RKr__1icxPOz8nCyNaABv17H2uHgHQ5Z_IW2
	3aCJWhnzNWhxDxzLDW_4b1ikD5f8J5wClsHz_JsMTBrx2PRPcN3nfmRyxmChX1Kj.OyAS07gQh_l
	dXTeIKhylw4gd6c2ic1wzo4DtPcA-
Received: from sonic.gate.mail.ne1.yahoo.com by
	sonic309.consmr.mail.ne1.yahoo.com with HTTP;
	Wed, 17 May 2017 08:01:47 +0000
Date: Wed, 17 May 2017 07:57:46 +0000 (UTC)
From: Abayiz <abayiz@yahoo.com>
Reply-To: Abayiz <abayiz@yahoo.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Message-ID: <593489191.1342122.1495007866183@mail.yahoo.com>
MIME-Version: 1.0
References: <593489191.1342122.1495007866183.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.9552 YahooMailNeo Mozilla/5.0 (X11; Ubuntu;
	Linux x86_64; rv:53.0) Gecko/20100101 Firefox/53.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-python]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 May 2017 08:01:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

meta-python pull request


