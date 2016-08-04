Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 49C8860722
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  4 Aug 2016 07:31:39 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1bVD7x-0002fu-Oq for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2016 09:31:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 4 Aug 2016 09:31:31 +0200
Message-ID: <nnur0j$tp2$1@blaine.gmane.org>
References: <cover.1470146419.git.akuster808@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
In-Reply-To: <cover.1470146419.git.akuster808@gmail.com>
Subject: Re: [PATCH 00/64] Krogoth-next patches under consideration
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
X-List-Received-Date: Thu, 04 Aug 2016 07:31:41 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 02-08-16 om 16:07 schreef Armin Kuster:
> Most GCC 6 fixed backported. A few packages where updated as they where mostly
> bug fixes and I noted addition reasons within the commits.
> 
> I am running builds now. please comment if there is any feedback or missed something.. I hope to have a formal request out by this weekend.
> 
> 

>   tvheadend: add CFLAG to ignore misleading indentations
>   geis: add CFLAG to ignore misleading indentations
>   fwts: add CFLAG to ignore misleading indentations

Won't this break building with gcc 4.x and 5.x?


