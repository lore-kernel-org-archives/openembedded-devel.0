Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 338AD60144
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 12:02:25 +0000 (UTC)
Received: (qmail 24507 invoked by uid 1003); 16 Apr 2014 12:02:26 -0000
Received: from unknown (HELO ?192.168.1.122?)
	(philip@opensdr.com@108.44.95.152)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	16 Apr 2014 12:02:25 -0000
Message-ID: <534E7151.5030504@balister.org>
Date: Wed, 16 Apr 2014 08:02:25 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
In-Reply-To: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
X-Enigmail-Version: 1.6
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Wed, 16 Apr 2014 12:02:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 04/16/2014 02:49 AM, Journeyer J. Joh wrote:
> Hello,
> 
> First of all I thank Nicolas Dechesne and Brian Hutchinson, for the
> previous kind replies.
> 
> While I was reading documents from Yocto Project, I found my source code in
> use in my company is of Open Embedded for MSM.
> 
> I found this from the git remote url of my surce code. It is
>   git://codeaurora.org/quic/le/openembedded/openembedded-core
> 
> And the one of Yocto project is
>   git://git.yoctoproject.org/poky
> 
>>From the git log prints poky is actively developped now but
> openembedded-core is not.
> 
> In a nutshell(I learned this expression today^^),
> - What is the relationship between those two? Any differences? Commons?
> - Can I refer to the documents about poky for my openembedded-core?

OpenEmbedded is the build system and has been actively developed since
2004 or so (give or take a few years)

Poky is the reference distribution from the Yocto Project.

The Yocto Project is working to make embedded development easier.

You should check the OpenEmbedded git server for activity;

http://cgit.openembedded.org/openembedded-core/

I'm guessing (without looking) the codeaurora git is based of a release
bench.

Philip

> 
> Thank you very much in advance.
> 
> Sincerely
> Journeyer
> 
> ----------------------------------------
> Journeyer J. Joh
> o o s a p r o g r a m m e r
> a t
> g m a i l  d o t  c o m
> ----------------------------------------
> 

