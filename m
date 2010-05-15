Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1ODJjO-0008Da-Qo
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 May 2010 17:56:53 +0200
Received: by gwb17 with SMTP id 17so1127174gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 May 2010 08:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=JcC9ShSKSlb5cO61NQBLECeARjGBWtenUaFXSU94Bbs=;
	b=FXoS3hYM6vJkk8Qpf6fZ5Aa2I9RJ7tKwz108xusQkrDCKFDVBSvn5P0jPo1BMo6rI6
	R5O9rHYsBSYuKEOLpD/TMQ5x+n1X6lgP7TOczyshdDJ4F/Xk2kQ5rDtizNPVQ87A4G7k
	DfAYyRUYljtZpCgocuBM629Q6P31iAOfccvgo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=gxj4DVzoDGiD3xLUW8TmcrL0+ik0E0FbxlkJaB3uVtJnTX0/5Y94TQ7OwVUUqVNIgv
	u+EVkGIQw1YLCIdKDqEasFY9c3fztYQMyrw55m6m4wU5fQ3YQMd6JiWn3fawPAORY4wU
	h85z9LscJcpG9GXA3g4mJDTK894s1pJqrVMQE=
MIME-Version: 1.0
Received: by 10.100.243.18 with SMTP id q18mr3508864anh.166.1273938772881; 
	Sat, 15 May 2010 08:52:52 -0700 (PDT)
Received: by 10.100.108.2 with HTTP; Sat, 15 May 2010 08:52:52 -0700 (PDT)
In-Reply-To: <1273912548.4196.2.camel@becca>
References: <AANLkTil89_7H3CIZOSZd9QjKE-Cf6mv5B7xpFCqaM8oM@mail.gmail.com>
	<1273859746.22943.454.camel@trini-m4400>
	<1273912548.4196.2.camel@becca>
Date: Sat, 15 May 2010 17:52:52 +0200
Message-ID: <AANLkTilZ_vbijWf3ZpC-_nK2NRANXcBJPpHZK_6_CoLj@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Issues with parallel build? (Was: gtk+native missing dep ?)
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
X-List-Received-Date: Sat, 15 May 2010 15:56:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

I'm using bitbake 1.10

commit bef07c6dc7e3b7b8c995d70ea429d141278b6eb6
Author: Chris Larson <chris_larson@mentor.com>
Date:   Thu Apr 15 08:04:35 2010 -0700

    Bump version from 1.9.0 to 1.10.0

I'd like to add that it seems a bit strange to see all that stuff in
the deps of console-image...but this was already discussed and in this
thread is OT ;)


Regards

Andrea


