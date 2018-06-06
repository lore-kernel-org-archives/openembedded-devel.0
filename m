Return-Path: <henning@itconsulting-heinold.de>
X-Greylist: delayed 423 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 06 Jun 2018 20:50:01 UTC
Received: from mail.familie-heinold.de (familie-heinold.de [85.214.48.103])
	by mail.openembedded.org (Postfix) with ESMTP id E147D77042
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 20:50:01 +0000 (UTC)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 4A577679C0B9;
	Wed,  6 Jun 2018 22:42:59 +0200 (CEST)
Received: from mail.familie-heinold.de (localhost [127.0.0.1])
	by mail.familie-heinold.de (Postfix) with ESMTP id 0368B679C0B7;
	Wed,  6 Jun 2018 22:42:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	h873313.serverkompetenz.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.itconsulting-heinold.de (x5ce7b54a.dyn.telefonica.de
	[92.231.181.74]) by mail.familie-heinold.de (Postfix) with ESMTPSA;
	Wed,  6 Jun 2018 22:42:57 +0200 (CEST)
Date: Wed, 6 Jun 2018 22:42:44 +0200
From: Henning Heinold <henning@itconsulting-heinold.de>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20180606204244.GA16170@mail.itconsulting-heinold.de>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
MIME-Version: 1.0
In-Reply-To: <10630413.xVAl2E7OaH@yow-masselst-lx1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: openembedded-devel@lists.openembedded.org,
	Otavio Salvador <otavio@ossystems.com.br>,
	Mario Domenech Goulart <mario@ossystems.com.br>
Subject: Re: [meta-java] maintainer status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Jun 2018 20:50:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 05, 2018 at 11:11:26AM -0400, Mark Asselstine wrote:
> Several of us have noticed that nothing has been merged to meta-java since 
> mid-April (roughly 8 weeks ago). With about a dozen commits sent to the list 
> and pending merges I thought I might email you, the maintainers, directly to 
> determine if this is expected to continue. Should we be looking to update the 
> maintainers list and/or recruiting new people to restore the vitality of this 
> repo? Have your roles or positions changed making it no longer viable for you 
> to contribute to this repo?
> 
> Thanks in advance for your responses.
> 
> Mark

Hi Mark,

if the situation is that bad, I can take over some reviews, but my time
is limited too and I can not run builds by myself, because of lacking
ressources.

Henning

PS: In few seconds I will push the proto xorg change.

