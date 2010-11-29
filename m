Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1PN17w-0004IP-Lp
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 11:38:33 +0100
Received: (qmail 8858 invoked by uid 503); 29 Nov 2010 10:41:33 -0000
Received: from b9.ovh.net (HELO mail428.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 29 Nov 2010 10:41:33 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 29 Nov 2010 12:37:13 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 29 Nov 2010 12:37:11 +0200
Message-ID: <4CF38257.3040406@eukrea.com>
Date: Mon, 29 Nov 2010 11:37:11 +0100
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.12) Gecko/20101103 Fedora/1.0-0.33.b2pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D34C@DEMCHP99E35MSX.ww902.siemens.net>
	<09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5D0@DEMCHP99E35MSX.ww902.siemens.net>
In-Reply-To: <09D9BE2AC4AA764DABAA8C91E48D819ED3B1D5D0@DEMCHP99E35MSX.ww902.siemens.net>
X-Ovh-Tracer-Id: 9391975548898225481
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] qte: fixed do_configure() for powercpc
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
X-List-Received-Date: Mon, 29 Nov 2010 10:38:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 29/11/2010 11:19, Aeschbacher, Fabrice wrote:
> Is this patch likely to be accepted and commited soon in branch release-2010.12, or should I overlay?
>
the patch doesn't apply can you please rebase it against master ?

Applying: qte: fixed do_configure() for powercpc
error: patch failed: recipes/qte/qte-common_2.3.10.inc:109
error: recipes/qte/qte-common_2.3.10.inc: patch does not apply
Patch failed at 0001 qte: fixed do_configure() for powercpc

Eric


