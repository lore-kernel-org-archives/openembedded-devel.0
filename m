Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SvTRv-0005ju-Si
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Jul 2012 15:22:24 +0200
Received: by vcbfy27 with SMTP id fy27so3621864vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Jul 2012 06:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=8uTlc5KSGF9rpUJYKjb5eEQ7gAJvcCBxJ0wySNl9roc=;
	b=C/Ewk43FtpWUoDbG009GMAAWjnpXqd314RAvFEe1cBtW9DSlJgm4E8Eyn3b+8volWE
	AmGLgncbEr0SeqNI0GekhIynzXYJfgOVpcqgeBMrnC7xdSdtpqRRV58eGOCf+FPTNPIL
	78rZH4K6TcbDTsMlMWkR87v2WzFwhb52NsLvjHD3OWgXwf7qZrf5qPj5K6uepdxkuksp
	Bu+ougBR2x9Jrhwz5643cn22cg6zUBuBBg+97kxrJr0LGWm0cWtw+tObhwqwYWfs3S7j
	GKH52mNTvQN9m4f6+ASthtpwVK0aYJKgvjAbPsTPQle9FvEu60sQ1F+McFHBM0D+3B4Y
	2Dgg==
MIME-Version: 1.0
Received: by 10.220.116.79 with SMTP id l15mr7964757vcq.69.1343567448543; Sun,
	29 Jul 2012 06:10:48 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.220.196 with HTTP; Sun, 29 Jul 2012 06:10:48 -0700 (PDT)
In-Reply-To: <1343515918-20671-2-git-send-email-raj.khem@gmail.com>
References: <1343515918-20671-1-git-send-email-raj.khem@gmail.com>
	<1343515918-20671-2-git-send-email-raj.khem@gmail.com>
Date: Sun, 29 Jul 2012 10:10:48 -0300
X-Google-Sender-Auth: pfM0snPXKdcug5UTyXUM3K_HBW0
Message-ID: <CAP9ODKrX04zfu_wVg317WPgc=u38niLtjmfkBiNrzfkTgBCbeA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd][PATCH 2/2] busybox: stopping systemd-kmsg-syslogd is not needed
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
X-List-Received-Date: Sun, 29 Jul 2012 13:22:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Jul 28, 2012 at 7:51 PM, Khem Raj <raj.khem@gmail.com> wrote:
> systemd-kmsg-syslogd.service is discontinued in systemd so
> there is no need to stop it.

I don't see a relationship in above description :-)

Or we drop it completely or it needs to be stoped ;-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


