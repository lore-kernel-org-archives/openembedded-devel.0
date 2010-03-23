Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mrt.karadenz@gmail.com>) id 1NtzVn-0006As-R1
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 09:30:56 +0100
Received: by iwn4 with SMTP id 4so2092158iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 01:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=wzp92+9GKM1AWTbxJJK2w4zUwrImQXBDplJKmh7tUxc=;
	b=UcKWehvRWmrkqS34vdzZl/dAP/RTd5UFOd8xWH8uVtTC94eAl48zIK9pMiIefnth8/
	pgv9pOybWSfvUVSqtKJvRt++91Ajd5Dpe4l/n9pTwzXqSxHToEqjW2/OfSPJ0gQNx7bI
	FIC+RzM22yAeua367L25LGk8eeQRtyar9cRmo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=ba1LT39Eya1z4LEHXBoTLmHTt4hOCf+opIAnzFIMreyL+HtnIimxoUXXbKjw0uNnzW
	md6aFYtRIhiA1ZuZcNe60RiRHV0svBWTh0zyy1vFOS3iLxQpX9QUStM1mCk6UQ69x6G3
	pb6mhCTupxhJLWQKmvYXNNehdoMvlfhFZMD2Y=
Received: by 10.231.182.79 with SMTP id cb15mr292194ibb.71.1269332866631;
	Tue, 23 Mar 2010 01:27:46 -0700 (PDT)
Received: from linux-dm4x.localnet ([88.224.192.131])
	by mx.google.com with ESMTPS id a1sm2194631ibs.0.2010.03.23.01.27.44
	(version=SSLv3 cipher=RC4-MD5); Tue, 23 Mar 2010 01:27:45 -0700 (PDT)
From: Murat Karadeniz <mrt.karadenz@gmail.com>
Organization: Bilkon Bilgisayar =?utf-8?q?Kontroll=C3=BC_Cihazlar_Ltd=2E?= 
	=?utf-8?q?_=C5=9Eti=2E?=
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 10:27:42 +0200
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.2-default; KDE/4.3.5; i686; ; )
References: <201003222055.23408.murat@bilkon-kontrol.com.tr>
	<201003222143.00252.murat@bilkon-kontrol.com.tr>
	<20100322201840.GB28005@denix.org>
In-Reply-To: <20100322201840.GB28005@denix.org>
MIME-Version: 1.0
Message-Id: <201003231027.42167.murat@bilkon-kontrol.com.tr>
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: mrt.karadenz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot_git recipe
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
X-List-Received-Date: Tue, 23 Mar 2010 08:30:56 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

it is ok now. I understood that -b option must be pass for a specific recipe 
but for a package by its name not with its version or release.

Thank you for the time and consideration...


