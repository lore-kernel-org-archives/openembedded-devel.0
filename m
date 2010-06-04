Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OKdOj-0008Ak-T7
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 22:21:46 +0200
Received: by vws4 with SMTP id 4so1669553vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 13:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=Mdq05ANZpBF0z6ls+NTDQJ7pwHNw7vXnRjXKoDM6qMQ=;
	b=OguwRPYi61wzJ9t+Kov44mQ8dbR3wU7/oz/90KFMFnVkjnbo5sFhXqO/5JsuT18dT1
	8gy+ISBiKhxdYxdDWHN0h1taUwpuDDANY51sziK+X4O4kSKToXRwdl/vB1svCwxp3xIB
	Q92aDJwQlD+NkXf01BTWKHIZ7BGnY4eZU6OeQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=DxtIRGuEvZx5nvTSjz40+zx7lZQIjDwN05dLd07T2DsSQy0jxU+rj4a7N47efU0LyP
	6bB9G9kELanX1cE8tJmbrKzeuguc+y7TYyGwgGtu4vIn0bdxNRlfWiLuhdKsG7d9YkEs
	nJlNUNTo8R53BvybGE8WvSrOyhXR0awIj+wLU=
Received: by 10.224.116.137 with SMTP id m9mr5341456qaq.162.1275682647840; 
	Fri, 04 Jun 2010 13:17:27 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.3.133 with HTTP; Fri, 4 Jun 2010 13:17:07 -0700 (PDT)
In-Reply-To: <1275682411-2638-1-git-send-email-denis@denix.org>
References: <1275682411-2638-1-git-send-email-denis@denix.org>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 4 Jun 2010 13:17:07 -0700
X-Google-Sender-Auth: 03PIkJXL31-7PI3R15oNXGhsKWo
Message-ID: <AANLkTilolWNmEkKTzOks8VjSFapP6Sk1m7SZThCn4MvD@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] amend.bbclass: don't parse same amend.inc if FILESPATH references it multiple times
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
X-List-Received-Date: Fri, 04 Jun 2010 20:21:46 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 4, 2010 at 1:13 PM, Denys Dmytriyenko <denis@denix.org> wrote:

> Signed-off-by: Denys Dmytriyenko <denis@denix.org>


Acked-by: Chris Larson <chris_larson@mentor.com>
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

