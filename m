Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TdnmQ-0002cV-1x
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Nov 2012 20:58:47 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so4266083pad.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2012 11:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=2Y4oc9OGfhe0TlgthhW6c901sSquCFUSz0JmPFoDBcQ=;
	b=YDkxp8Sv6GM4z2NAthtEVcZkLbbtMkmOAwR+r7LjmiVrFvQk69Zwju5V88bzpBXTii
	1aoMKivRK6BMAF0aPNOVG6eakgZBrqK15t4T+Lutwmawb7tZ7y1Daytn/n8MBJEW/ZOI
	u8AMuuF9TfnYPXwTz8QU1J8dg78Jn9w0g6D/6gpAK7Cq6rdVvnG2LIGqlBFuUbAcT1Ur
	Tcckqv6mhR+Ht5GevrPLVwYpA+Bzau0mvtZRXzj4K4cbIfYlbWVruNEXpTOsaHwOGR9M
	z96PjL8vfYDK7PhxWuK0xrsHhWlZO94+B2ByTgqd6Cex5i7hiVrxNjCcsAVmiL2gi/NN
	TBTA==
MIME-Version: 1.0
Received: by 10.68.213.33 with SMTP id np1mr60949501pbc.64.1354131873113; Wed,
	28 Nov 2012 11:44:33 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Wed, 28 Nov 2012 11:44:33 -0800 (PST)
In-Reply-To: <1354131040-9077-3-git-send-email-mario@ossystems.com.br>
References: <1354131040-9077-1-git-send-email-mario@ossystems.com.br>
	<1354131040-9077-3-git-send-email-mario@ossystems.com.br>
Date: Wed, 28 Nov 2012 17:44:33 -0200
X-Google-Sender-Auth: SZF9UaVM8haa5VPQ4aTyBcq4fgY
Message-ID: <CAP9ODKqVz8myHd+xCYh_FBOn=XjxgekEZwtpk2BojS5r7Yg-Fw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 3/6] openbox: separate package for configuration files (openbox-config)
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
X-List-Received-Date: Wed, 28 Nov 2012 19:58:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 28, 2012 at 5:30 PM, Mario Domenech Goulart
<mario@ossystems.com.br> wrote:
> Signed-off-by: Mario Domenech Goulart <mario@ossystems.com.br>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


