Received: from mail-oa0-f45.google.com ([209.85.219.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UXC39-0002OB-94
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Apr 2013 17:01:07 +0200
Received: by mail-oa0-f45.google.com with SMTP id o17so567148oag.18
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Apr 2013 07:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:date:x-google-sender-auth:message-id
	:subject:from:to:content-type;
	bh=czMNPiKDkRHPP3sBSKjtmdTKbcgBrMAQ6S54Gc3f+Vs=;
	b=mxFclaxrzrQsDTEMR0gd61Bfb/9ogjtNTQMTHpxjKPR5px3VFA0qROZ/T5RPcBkmYD
	G4Z/WPCS2HqxD9Q++IrLO0CjCDB5AeYE7KdiZIi1dLTo1hVJ9OJYwVtcLmtSjA0wyqE4
	viv9ZUTJs0F1AJr2NmYlRbm9znShaZ911dLxuRl4VTcNwGWuhJ5vSVRJ6VVy0VtyQNFV
	2cr7ZZaUQEccMxpRAYPF3ZrgyCO5Mb3u0lx4NfNNHFG9+9XUJeU1kd1DePlaVjo7POB0
	qHLTicZHhpojHeqoQsD/gt5s3SBgxNKHFxjUdfdfD8bXot1287B8aaBxvvbiO3Ik8k3b
	Bk/g==
MIME-Version: 1.0
X-Received: by 10.60.133.112 with SMTP id pb16mr30369370oeb.93.1367332977808; 
	Tue, 30 Apr 2013 07:42:57 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.89.226 with HTTP; Tue, 30 Apr 2013 07:42:57 -0700 (PDT)
Date: Tue, 30 Apr 2013 11:42:57 -0300
X-Google-Sender-Auth: OJZX0wV2oFUTP5Vw0iGKzCH20Fo
Message-ID: <CAP9ODKpttkSQqRinJQWmDhWTeE+iXJWnLBDqZ1rsath6tJ2Xmw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-gnome] gvfs build error
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
X-List-Received-Date: Tue, 30 Apr 2013 15:01:29 -0000
X-List-Received-Date: Tue, 30 Apr 2013 15:01:29 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

Did someone see:

| metatree.c:71:1: error: unknown type name 'GStaticRWLock'
| metatree.c:71:38: error: 'G_STATIC_RW_LOCK_INIT' undeclared here
(not in a function)
| metatree.c: In function 'meta_tree_ref':

?

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


