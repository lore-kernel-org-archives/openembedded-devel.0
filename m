Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JZYrk-000074-4U
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 22:52:06 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2CLnwjI001904
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 21:49:58 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01703-06 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 21:49:54 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m2CLnrDr001898
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Wed, 12 Mar 2008 21:49:54 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <fr9hg6$9us$2@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>
	<200803111126.04715.openembedded@haerwu.biz>	<fr5ntp$n0v$1@ger.gmane.org>
	<20080311114938.GM30267@ibawizard.net>
	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>
	<20080311145739.GN30267@ibawizard.net>
	<1205250588.4521.111.camel@dax.rpnet.com>
	<20080312014945.4783ae6a@widy.localdomain>
	<1205280598.16531.26.camel@dax.rpnet.com>
	<20080312024408.44d9192e@widy.localdomain>
	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>
	<fr997r$aat$1@ger.gmane.org> <1205356290.4530.7.camel@dax.rpnet.com>
	<fr9hg6$9us$2@ger.gmane.org>
Date: Wed, 12 Mar 2008 21:49:55 +0000
Message-Id: <1205358595.4530.17.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 21:52:07 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-03-12 at 22:21 +0100, Koen Kooi wrote:
> Richard Purdie schreef:
> | On Wed, 2008-03-12 at 20:00 +0100, Koen Kooi wrote:
> 
> |> while with hg it's just 'hg serve'.
> |
> | How do two hg servers interact?
> 
> I don't get your question, could you eloborate?

How does the hg server on oe.org interact with the one nslu2 or any
other project may setup?

Cheers,

Richard



