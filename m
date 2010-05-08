Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OAftP-00039w-V9
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 May 2010 11:00:16 +0200
Received: by fg-out-1718.google.com with SMTP id e12so106077fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 08 May 2010 01:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=auM200tBIKeErrNXXI1L5jB8xOqgFBNXDR/pG//UIFg=;
	b=U6ZYT+zvqWDMUv5aZt/mZTBubefeIJrR4Hqb7x95mlfMS1WQYKSeSwhDsrU5pqRmNR
	AW4xBIW+oFCiwJs6d+xKr6CpPibV9Tt/SVIa3H6hQ8mldLHxCgMH9dwpsabvFUVvQS/q
	MSyfmb28YZA0SUvYBLvYfo6FPYpY20Pl/KkTY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=a0GPGUeb4L9B2e7j3xUsfVXXQPKzXxy/FBHMOME7iyhYaWIaR6NxhAu0P3OkY+3kNY
	0AESkOKdeEl7w/H55ecSa7eo45DT2zQINfy22/wtR2JlXzZbpLtFqwtYICSSZ0qXJu5z
	g/huCEcQ+EMh9wmrHAipPq7CRDxCGeXD5cJbs=
MIME-Version: 1.0
Received: by 10.239.181.12 with SMTP id k12mr103778hbg.194.1273308987769; Sat, 
	08 May 2010 01:56:27 -0700 (PDT)
Received: by 10.239.192.77 with HTTP; Sat, 8 May 2010 01:56:27 -0700 (PDT)
In-Reply-To: <v2sd1b08f941005071617u31274631hcddebb5b9eeb888d@mail.gmail.com>
References: <v2sd1b08f941005071617u31274631hcddebb5b9eeb888d@mail.gmail.com>
Date: Sat, 8 May 2010 10:56:27 +0200
Message-ID: <n2zd1b08f941005080156gd17a92cbk9985dc913c13fb0a@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gtk+native missing dep ?
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
X-List-Received-Date: Sat, 08 May 2010 09:00:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

For some reasons  "atk-native"  and  "pango-native" builds were not
finished when gt+-native was building...

DEPENDS_virtclass-native = "libpng-native atk-native pango-native
cairo-native libxrender-native libxext-native"

Investigating

Andrea


