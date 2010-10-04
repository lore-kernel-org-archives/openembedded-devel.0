Received: from 26.mail-out.ovh.net ([91.121.27.225])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1P2gXK-0002jo-EU
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Oct 2010 10:36:42 +0200
Received: (qmail 15864 invoked by uid 503); 4 Oct 2010 08:41:30 -0000
Received: from b9.ovh.net (HELO mail620.ha.ovh.net) (213.186.33.59)
	by 26.mail-out.ovh.net with SMTP; 4 Oct 2010 08:41:29 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 4 Oct 2010 10:36:29 +0200
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 4 Oct 2010 10:36:27 +0200
Message-ID: <4CA99206.5060001@eukrea.com>
Date: Mon, 04 Oct 2010 10:36:22 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; fr;
	rv:1.9.2.9) Gecko/20100915 Thunderbird/3.1.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CA97897.4020001@nedap.com>
	<4CA97EBC.4040406@eukrea.com>	<4CA98CEF.3090604@nedap.com>
	<AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
In-Reply-To: <AANLkTik2_YEL-dhKLr9LuJQ78W4WXS4WvUbxDfXeJk8U@mail.gmail.com>
X-Ovh-Tracer-Id: 10523504955470359881
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
Subject: Re: trouble compiling udev
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
X-List-Received-Date: Mon, 04 Oct 2010 08:36:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Le 04/10/2010 10:24, J. L. a écrit :
> On Mon, Oct 4, 2010 at 1:14 AM, Jaap de Jong<jaap.dejong@nedap.com>  wrote:
>> Thanks!
>> That seems to work!!
>> Something to be added to udev recipe...
>
> Any chance you can post your recipe I am not sure if I am getting
> where you added that in the recipe. Thanks
>
CFLAGS_append = " -Os"

Eric


