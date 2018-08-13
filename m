Return-Path: <prvs=756920f33=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 82B057453A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Aug 2018 20:57:50 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,235,1531778400"; 
   d="scan'208";a="1605495"
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	<openembedded-devel@lists.openembedded.org>
References: <20180813150918.26582-1-git@andred.net>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <855f175a-8f1a-5f52-368f-0a9455df3cee@skidata.com>
Date: Mon, 13 Aug 2018 22:57:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813150918.26582-1-git@andred.net>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java] prepare for openjdk-8 build infra re-use
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
X-List-Received-Date: Mon, 13 Aug 2018 20:57:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: de-AT
Content-Transfer-Encoding: 8bit

Hi,
this is a note to let you know that I've just added this patch series
to the master-next branch of the meta-java repository at
	git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 08/13/2018 05:09 PM, André Draszik wrote:
> Icedtea 7 and OpenJDK 7 will need to apply new compiler flags for certain
> compiler version without breaking support for older (host) compilers.
> 
> Move to a common class so that the same code can be re-used.
> 
> This series sits on top of my earlier patchset from today.
> 
> 

