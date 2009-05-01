Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1M00bx-0008H9-2G
	for openembedded-devel@openembedded.org; Fri, 01 May 2009 23:49:37 +0200
Received: by an-out-0708.google.com with SMTP id c3so1522021ana.30
	for <openembedded-devel@openembedded.org>;
	Fri, 01 May 2009 14:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=Cy0XgZAUerRdul2jYFJ5o/NZHoby15fTLwbaIKOYT+o=;
	b=a4ILLzczDJaW0MMxj5c0f4Zz2jomT22cDBH3InFvd/279oKdxu8Hyy042WG1XI8ald
	ONGr7Y9vos9Zk/c2tu4SxySx3XWhyXt9kbzyEpCMEqnmu+z53PVIpn85A+3iRq4o4UWq
	O8D4+7us9spFujC1JPzn5b1Wu8lqKdyk2Ues8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=NPmbce4+IMaw5Vfd/cJYRNmrs6YFaUFrGsWY2Bv1eTr4hqVXslnB7b1yb0nenCF8hh
	OS24XB5cBkqZa0ztYHSgc08U30MNswj8sugmTJIciscFlGMwqbndxiVxjxR3nrMud8PO
	VXLNWCd1MbrIB9Hoh2BXp4RbpxwU6z/vqTdpk=
MIME-Version: 1.0
Sender: otavio.salvador@gmail.com
Received: by 10.100.189.10 with SMTP id m10mr6878616anf.47.1241214246090; Fri, 
	01 May 2009 14:44:06 -0700 (PDT)
In-Reply-To: <49FAE94F.2090101@doredevelopment.dk>
References: <49FAE94F.2090101@doredevelopment.dk>
Date: Fri, 1 May 2009 18:44:06 -0300
X-Google-Sender-Auth: e6acdd559da50789
Message-ID: <be7a9f3d0905011444l31afb6eby4b2638e0288be038@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: =?UTF-8?B?UmU6IFB1bGwgcmVxdWVzdCBmcm9tIERvcsOpRGV2ZWxvcG1lbnQgLSBOZXc6IE1pY3JvIGRpc3Ryby9pbWFnZQ==?=
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
X-List-Received-Date: Fri, 01 May 2009 21:49:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello Martin,

On Fri, May 1, 2009 at 9:21 AM, Martin Lund <mgl@doredevelopment.dk> wrote:
> Hello OE dev,
>
> Please pull the changes from the following repository:
>
> git pull git://dev.doredevelopment.dk/oe-micro.git master

I believe it would be better if you could get commit access and just
use the mailing list for review. So you can commit it yourself :-)
What others think?

Besides that, after it gets in ... it would be nice to port it to our
stable branch and propose it to get added to it. It is quite nice as
basis for a system so please keep it going :-D

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


