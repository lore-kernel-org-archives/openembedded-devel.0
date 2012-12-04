Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TfyZ8-0004AX-Jf
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Dec 2012 20:54:03 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2679722pbc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Dec 2012 11:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=Kr2YlZyJ1c29ZGkVb42ZdWhdMyhMRKE400LoDqFoDnw=;
	b=A91hGItIzbGeOcznZHL7ubj6KCHdwPtCfELkmcp2SA7IDKBIfaW4TZ02eJm1wPq2y3
	RkLL2/+2/NUi7HL9z8Lxen0dKx8BZL5a7IYymWZdXHbs24bdDNDylAE9QIuNjnmYDfKd
	Rjus/sJ3sqGMm3LrS2+ptABMZb0b73Aj7htaMq4YmnK9mSKS3oSiqrUiFlwLPhDkTg9x
	PjYossacVvZg67f8aGjIaVo/wY1miaxQO90P1YGSWvShVW3AyYYXeYaxbZodhFzXaBRF
	75VcwnNboPMTlTbZD7mZ3hJLxsApVBIUQqWUXecrcP40x2xEJdXO1f6RFVcfKECU/1rR
	+6kw==
MIME-Version: 1.0
Received: by 10.68.234.98 with SMTP id ud2mr41607579pbc.136.1354649978823;
	Tue, 04 Dec 2012 11:39:38 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Tue, 4 Dec 2012 11:39:38 -0800 (PST)
In-Reply-To: <3145293.jEgb7vZ7zI@helios>
References: <3145293.jEgb7vZ7zI@helios>
Date: Tue, 4 Dec 2012 17:39:38 -0200
X-Google-Sender-Auth: BI23rWprpcTPfiIvXm9Kge9zmrs
Message-ID: <CAP9ODKqrUeGENSFE--zCfyRwoySe2ieXyOLj1EsjqD+rFK8gkw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE-Classic patches in patchwork
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
X-List-Received-Date: Tue, 04 Dec 2012 19:54:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Dec 4, 2012 at 4:11 PM, Paul Eggleton <paul.eggleton@linux.intel.com
> wrote:

> There is a significant volume of patches in the OE patchwork [1] that are
> intended to apply to OE-Classic. Apart from the 2011.3-maintenance branch,
> OE-
> Classic is no longer maintained in favour of OE-Core + layers, so the
> question
> is what should we do with these patches? At the moment I'm thinking we
> should
> just mark them as "archived" so that they disappear from the queue; people
> can
> still get access to them if needed.
>
> Thoughts?
>

I fully agree.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

