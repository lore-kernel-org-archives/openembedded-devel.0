Received: from mail-ew0-f211.google.com ([209.85.219.211])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mickael.chazaux@gmail.com>) id 1NxJLw-0001rr-L1
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Apr 2010 14:18:29 +0200
Received: by ewy3 with SMTP id 3so92078ewy.26
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Apr 2010 05:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:received:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=DTQm4sc14oG8SVwvhLGJWJInpfrXamYGXxTNuE5Kq0w=;
	b=E1bH/BHb7QB69ULdSeA8WnGnQHvysCP6wQ2VwuCtRzbbxJUJ2ZqqjnbIog2LuX6g4W
	4Vimjnel34m9TAzfjaZB3V/HH4+TZ+bG63Ey75vuNHtP75KzrufBY5J2zL1bWbqhqPvM
	r1/yHJEd9xGOviEUf3Cta5ahpXHV35A76L9mg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=ELWjf9/zUnyoM6Xd1aZBtEYgImbS2eAiv50jVRcDXC26Yb1Ha6jbkPvdGIKQ/wZjlC
	2hKpo0Pu0BXrXY1rsuirbaTDZ9LR/WafkE/okf8smJYyEv7vrNcoqQGaZw/jKvnVLSok
	YOWakPuW0Y9fLz4UhXHt0UP+pHcsyy7paZYrk=
MIME-Version: 1.0
Sender: mickael.chazaux@gmail.com
Received: by 10.213.4.70 with HTTP; Thu, 1 Apr 2010 05:15:11 -0700 (PDT)
In-Reply-To: <4BB43A16.2040708@fqingenieria.es>
References: <1269935184-21934-1-git-send-email-mchazaux@adeneo-embedded.com>
	<20100331204928.GB14197@gmail.com> <4BB43A16.2040708@fqingenieria.es>
Date: Thu, 1 Apr 2010 14:15:11 +0200
X-Google-Sender-Auth: 74bc3ea29521d51e
Received: by 10.213.50.141 with SMTP id z13mr408972ebf.70.1270124111957; Thu, 
	01 Apr 2010 05:15:11 -0700 (PDT)
Message-ID: <p2xbc36f8ed1004010515j685306c9kc58c3b2647dc66da@mail.gmail.com>
From: Mickael Chazaux <mchazaux@adeneo-embedded.com>
To: Jaume Ribot <jaume@fqingenieria.es>
X-SA-Exim-Connect-IP: 209.85.219.211
X-SA-Exim-Mail-From: mickael.chazaux@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] Add Freescale i.MX25 3stack support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Apr 2010 12:18:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

2010/4/1 Jaume Ribot <jaume@fqingenieria.es>:
> Thanks for patch! I will try it.
> Just a comment: Any reason for not using last Freescale Linux version?
> (2.6.31)

I will resubmit a patch using this version.

Regards,

Mickael CHAZAUX

Adeneo Embedded - Adetel Group
2, chemin du Ruisseau
69134 ECULLY - FRANCE
T=C3=A9l. : +33 (0)4 72 18 08 40 - Fax : +33 (0)4 72 18 08 41


