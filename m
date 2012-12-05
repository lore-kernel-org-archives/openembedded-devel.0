Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>)
	id 1TgLE1-00006N-S7; Wed, 05 Dec 2012 21:05:46 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3441674pbc.6
	for <multiple recipients>; Wed, 05 Dec 2012 11:51:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=WOZ9T/Ul14qOVMZH5Wv3UcMEzuzpcEnvLp5Zmz6UM2Q=;
	b=Eg8zknqRjk1ejDV2I6CwOuKH/SCdfdIq1cgqlM/yymsSMMI1T6iauZPsAAbADJ8lum
	AIp5/x7dmocTes4Me+jqdQMSHSKXy2GngNLrDxnC1jfePrCGamHCjly6GBXkkRm1tF4Y
	9hM9vbb/1Jo/DOyBzH6y87VOSKszv3MT5H5m/qKGLa4wJkASuJDO+enzbGJRY3pAZ98D
	DfpbCaIpfYwkZcwCv2M+J5IgxjxBYscXATwV44CSgAgRCy/Qz239W5EM6upGxjgDMH4e
	5lUfAbWwC7F0h51224oUM4te3QXp5yitGGFTCAzPZIuiIFOf2JE4i89MBROkkYLuH034
	NGEA==
MIME-Version: 1.0
Received: by 10.68.252.4 with SMTP id zo4mr52464190pbc.126.1354737080579; Wed,
	05 Dec 2012 11:51:20 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 5 Dec 2012 11:51:20 -0800 (PST)
In-Reply-To: <20121205161802.GD3396@jama.jama.net>
References: <20121204094959.979C9103B4@opal>
	<20121205161802.GD3396@jama.jama.net>
Date: Wed, 5 Dec 2012 17:51:20 -0200
X-Google-Sender-Auth: KptfwLptTJb0Mo7-Ohu3oxQp2LY
Message-ID: <CAP9ODKrxOQW=f6x17KO4Thpnu-js_UGANVhV4mG-8PQxTOuVJQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: openembedded-commits@lists.openembedded.org,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [oe-commits] Mario Domenech Goulart : freerdp: update to the latest commit (2012-11-20) in the stable-1.0 branch
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
X-List-Received-Date: Wed, 05 Dec 2012 20:05:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Dec 5, 2012 at 2:18 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Tue, Dec 04, 2012 at 09:49:57AM +0000, git@git.openembedded.org wrote:
> > Module: meta-openembedded.git
> > Branch: master
> > Commit: e7e3fd797b46a85ffc03cc7c4b2267d686476f93
> > URL:
> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=e7e3fd797b46a85ffc03cc7c4b2267d686476f93
> >
> > Author: Mario Domenech Goulart <mario@ossystems.com.br>
> > Date:   Mon Dec  3 16:03:22 2012 +0000
> >
> > freerdp: update to the latest commit (2012-11-20) in the stable-1.0
> branch
> >
> > Change-Id: I9b872c1aa9a17e6ef9dc0fd4b18dfe9f354f62a6
> > Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>
> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>
> Not sure if it's caused by this patch or was failing before too,
> but freerdp-extension-xpunlimited is now failing to build:
>

The extension was base in 0.9 version of FreeRDP so it was not working
before. I will check if we can fix it.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

