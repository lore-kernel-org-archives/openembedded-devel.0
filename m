Received: from 63.mail-out.ovh.net ([91.121.185.56])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1OysOq-0003R7-HL
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Sep 2010 22:28:14 +0200
Received: (qmail 10933 invoked by uid 503); 23 Sep 2010 20:52:37 -0000
Received: from b9.ovh.net (HELO mail239.ha.ovh.net) (213.186.33.59)
	by 63.mail-out.ovh.net with SMTP; 23 Sep 2010 20:52:37 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 23 Sep 2010 22:28:07 +0200
Received: from tal33-3-82-233-81-124.fbx.proxad.net (HELO ?192.168.2.15?)
	(ebenard%eukrea.com@82.233.81.124)
	by ns0.ovh.net with SMTP; 23 Sep 2010 22:28:07 +0200
Message-ID: <4C9BB856.7080200@eukrea.com>
Date: Thu, 23 Sep 2010 22:28:06 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1285081581-19915-1-git-send-email-kergoth@gmail.com>
	<4C98ECCF.6010903@freyther.de>
In-Reply-To: <4C98ECCF.6010903@freyther.de>
X-Ovh-Tracer-Id: 13283085627644685641
X-Ovh-Remote: 82.233.81.124 (tal33-3-82-233-81-124.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.185.56
X-SA-Exim-Mail-From: eric@eukrea.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] utility-tasks.bbclass: drop mrproper task
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
X-List-Received-Date: Thu, 23 Sep 2010 20:28:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 21/09/2010 19:35, Holger Freyther a écrit :
> On 09/21/2010 11:06 PM, Chris Larson wrote:
>> From: Chris Larson<chris_larson@mentor.com>
>>
>> This task is misleading and potentially quite harmful, as it wipes the entire
>> DL_DIR, yet tasks are supposed to be recipe specific.  We have the proper
>> distclean task to wipe sources for a recipe + run do_clean, and the user can
>> always wipe all of DL_DIR manually if necessary.
>>
>> Signed-off-by: Chris Larson <chris_larson@mentor.com>
>
> Acked-by: Holger Hans Peter Freyther <holger@moiji-mobile.com>

Acked-by: Eric Bénard <eric@eukrea.com>


