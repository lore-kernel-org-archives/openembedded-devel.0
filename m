Return-Path: <lchristina26@gmail.com>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3B5647051A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 19:57:40 +0000 (UTC)
Received: by mail-ig0-f182.google.com with SMTP id c1so3565463igq.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jul 2014 12:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=ADM4/MK4xV/u2CsCOtuMg9k5z8iywIs1p357PwoHK0k=;
	b=eLILx1Q0SgEilrdONl1IuyLKdacOUYtW/aiYQ6HqpZeMSuda4rDPGU7axKxnZPSl+6
	ofRVmlS//JBBbenauD0JJnog3liFwG+Qh3IT6Zrq9tS+/86QTTFWmT3CA1dUo/TpgrWG
	HlXWXp9KXqXtK1LsKEGfo5BaOsDvakry2JOX/Y3ZIrgAAZOBrpjEU7NbUiVrhtdWxH3Y
	o/H6cgRMNS1ZPTO+Ui146rOf1tO/3mGwLoUFIg0WmMFBxm/gNoP2mlsR0QRK7cwqGwNR
	Ue+aJ08xZC5vPja0DfCO7qXd2mgqK2caKtPJdYSvso5SKnAKHlJN+XDBZUodEDONe3o2
	jGBw==
MIME-Version: 1.0
X-Received: by 10.50.50.229 with SMTP id f5mr56866229igo.42.1406750261269;
	Wed, 30 Jul 2014 12:57:41 -0700 (PDT)
Sender: lchristina26@gmail.com
Received: by 10.64.11.102 with HTTP; Wed, 30 Jul 2014 12:57:41 -0700 (PDT)
Date: Wed, 30 Jul 2014 13:57:41 -0600
X-Google-Sender-Auth: Q52wYd0qblPyXDAOKoR1iPUIidI
Message-ID: <CAL0pqZ0hXybc_m5_wsbtoeekbz0FUrFFK=jXcsa2Jm+3XugEzA@mail.gmail.com>
From: Leah <leah@wolfssl.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Add recipe to meta-oe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Jul 2014 19:57:45 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I have a recipe - cyassl_3.1.0.bb <http://cyassl_3.1.0.bb>, a lightweight
ssl library that I would like to add to openembedded. Please let me know
the steps I need to follow to add my recipe.

Thanks,

Leah

-- 

Leah Thompson
www.wolfssl.com
leah@wolfssl.com
406-570-1389
Skype: lchristina26

