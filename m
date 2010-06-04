Received: from fg-out-1718.google.com ([72.14.220.152])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matgnt@gmail.com>) id 1OKgvJ-0006z3-Fc
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 02:07:37 +0200
Received: by fg-out-1718.google.com with SMTP id 16so238087fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 17:03:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=cWf6Lt4UcHUW5KuxRgjTZ8CgZXCXFeQ5+S5RgTzZFfg=;
	b=EtoT8oqqnly5MI8gXsYeTV1DbBCrbg+bqb0RVFrgzbfVU0nVdhWqF6+zTAXeExFe+5
	lCBPgAOvOP3oGr3AmkXx4FPV4K526T4Y66dO74ZkL7Ggpk1h5JFkSa6VzFL+bA0ztzgd
	E+ysZ0JJ+Q6aPZIeH3JJKYDYtRf9y8ZdGIxHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=pzsYUxTult+0mO58s33lRIyQr+sp7aSewhKzjE/DQmRFaHRg+cNBcZFKiOtsinxqEz
	oSIiPI/R0GEdnBx+g+o0tdP1t9senDnv0Bfi9F6BmUEepos4WE9z+wrcEF0tEms0XXfO
	VUyym7YFBMbSugL7OuG6jEb26al8UhA3W4S7E=
Received: by 10.87.5.30 with SMTP id h30mr18697893fgi.3.1275695857543;
	Fri, 04 Jun 2010 16:57:37 -0700 (PDT)
Received: from [192.168.5.27] (z0701.wist.uni-linz.ac.at [193.171.42.194])
	by mx.google.com with ESMTPS id e20sm2366808fga.16.2010.06.04.16.57.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 16:57:36 -0700 (PDT)
Message-ID: <4C0992ED.6000102@gmail.com>
Date: Sat, 05 Jun 2010 01:57:33 +0200
From: =?ISO-8859-1?Q?Matthias_G=FCnther?= <matgnt@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.9) Gecko/20100423 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.152
X-SA-Exim-Mail-From: matgnt@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: qt4 upgrade to 4.7.0-beta1
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
X-List-Received-Date: Sat, 05 Jun 2010 00:07:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello.

I've been working with QML (Qt Quick) for some time now and therefore
I've created recipes for Qt 4.7.0-tp and beta1 versions. The patches
just disable the not cross compiling parts (e.g. some demos/examples).

Should I send the beta1-patch to the ML or is it better to wait for the
final release?

Regards
Matthias


