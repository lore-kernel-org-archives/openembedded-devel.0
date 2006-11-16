Received: from [64.233.166.179] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1Gkr35-0000Hj-BE
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Nov 2006 00:53:39 +0100
Received: by py-out-1112.google.com with SMTP id n39so412567pyh
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2006 15:51:20 -0800 (PST)
Received: by 10.35.49.15 with SMTP id b15mr2135173pyk.1163721080123;
	Thu, 16 Nov 2006 15:51:20 -0800 (PST)
Received: by 10.35.118.16 with HTTP; Thu, 16 Nov 2006 15:51:20 -0800 (PST)
Message-ID: <432beae0611161551g2f69d6edmacf41d3b436c0a1b@mail.gmail.com>
Date: Thu, 16 Nov 2006 15:51:20 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200611170042.29062.openembedded@hrw.one.pl>
MIME-Version: 1.0
References: <200611170042.29062.openembedded@hrw.one.pl>
Subject: Re: RFC: /removal.txt - list of metadata planned for removal
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Nov 2006 23:53:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 11/16/06, Marcin Juszkiewicz <openembedded@hrw.one.pl> wrote:
>
> During this week I'm fetching sources for whole 'world' and noticed many
> unfetchable things. Because just dropping them from metadata is not best
> way I was thinking about creating file with informations which parts of
> metadata will be removed. File will be named 'removal.txt' and will
> reside in / of repository.
>
> Proposed format:
>
> Package Name:   plinciv
> Removal Date:   2006-11-20
> Maintainer:     none
> Reason:         Unfetchable version from 2003 year.
>
>
> What do you think about it?
>

Looks good to me.

-- 
Justin Patrin


