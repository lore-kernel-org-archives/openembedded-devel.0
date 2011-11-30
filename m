Received: from mail-bw0-f51.google.com ([209.85.214.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RVq7W-0002Ch-Gk
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Nov 2011 20:47:07 +0100
Received: by bkat8 with SMTP id t8so1238721bka.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Nov 2011 11:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=ra2hkVALzP32UmllgsuSXTn/XBQ8nO3ky66OsvpaHEk=;
	b=mmJ8++L+c+c05AwCAOAG1+ZzQUjTsFpFMZQ3QJ64v4uA/ff1WaAtttHu0M3+fLSbI1
	6GLg9i91l4sBsT12CFLqP+NQQ27ygrJagET5+UwdeQttum8NNMKoiNVcFawVEFJuCi59
	OtSa2BzBGmns+cYftdBQdbGwXmn8TmdY4jjcg=
MIME-Version: 1.0
Received: by 10.204.157.133 with SMTP id b5mr3702619bkx.121.1322682023045;
	Wed, 30 Nov 2011 11:40:23 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.204.54.74 with HTTP; Wed, 30 Nov 2011 11:40:23 -0800 (PST)
In-Reply-To: <jb5vpp$c8o$1@dough.gmane.org>
References: <jb5vpp$c8o$1@dough.gmane.org>
Date: Wed, 30 Nov 2011 17:40:23 -0200
X-Google-Sender-Auth: 5yr9RKgbNb-uLTJ0GBrZyk3xxzY
Message-ID: <CAP9ODKrc5FEriRchZuiAYKfa+dyXO+kfxFn=0E3ExYYeey8pJA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: OE-core based java layer?
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
X-List-Received-Date: Wed, 30 Nov 2011 19:47:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 30, 2011 at 17:22, Koen Kooi <koen@dominion.thruhere.net> wrote:

> Are there already people working on such a thing or should I just go ahead
> and add a meta-java to the meta-oe repo and start importing recipes
> one-by-one?
>

https://github.com/woglinde/meta-java

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br

