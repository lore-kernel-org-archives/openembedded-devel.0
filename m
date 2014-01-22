Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4F8426002A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 11:12:25 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id g12so243850oah.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jan 2014 03:12:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=kGE/SgkYgw8Hw9kuhUtP+IckqrTMyJAPtp4YGaEipck=;
	b=ceS58IWWhBGx9EJyYZo8H7dLP9eCMuVRGX5qpa4F+OSh6E8VFoLkGjxKlXKz+zg/QU
	QGjrmXwyfJGXmgES1xPz02EOon093JztWeYauilO3usDsQxQOvT4SiJaphcs1hG9RaQx
	7sGWCUGXtB0Y4QStXJUe/ZNcYRsiSpOSznZew5EAu49ftPkR2F15dUUiNUROsKkjVQSa
	rgglgbnHpCwrCNNvOzLYatr4lxuRVEYy1hNGo5lfobMriXjSbyWh1xSi3UPp+0L7S+vu
	fgGUdwxQYiv7kkzeYXWOMg5lHPlWq+Ssrn/SnlGkcFeqGL/URHDRza+hrAoTqvMb7oDb
	tbkw==
MIME-Version: 1.0
X-Received: by 10.182.144.136 with SMTP id sm8mr682206obb.63.1390389145855;
	Wed, 22 Jan 2014 03:12:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Wed, 22 Jan 2014 03:12:25 -0800 (PST)
In-Reply-To: <20140119090626.GA3742@jama>
References: <20140119090626.GA3742@jama>
Date: Wed, 22 Jan 2014 09:12:25 -0200
X-Google-Sender-Auth: HI6S5DBQ6eD2CkMWbye4LfnjY9Q
Message-ID: <CAP9ODKpOKoMwdHQRtntVQFzbShvzYh00gq4YurT_JHER0FOFYg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: meta-oe patch queue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 22 Jan 2014 11:12:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

On Sun, Jan 19, 2014 at 7:06 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Apologies for delay, there is blocking jenkins job running for 10days
> already (which should take 40minutes tops).
>
> It should finish very soon (well I'm thinking that since Monday).
>
> For better visibility and consistency with oe-core, I've started pushing
> my patch queue from patchwork "in-test" bundle (I'll rename it to
> "master-next" when it's emptier) to
>
> meta-openembedded/master-next
> instead of
> meta-openembedded-contrib/jansa/in-test
>
> Please test patches in master-next and send reviews on ML, but be aware
> that it's rebased often on top of master.
>
> BTW: there is also meta-qt5/master-next now (with 5.2)

I am using master-next as master has many know (and already fixed
issues). Please push master-next as it is taken too long.

Please don't take me wrong, your test is quite valuable but we also
must keep know fixes being merged...

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

