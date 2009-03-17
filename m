Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LjNcQ-0006Zv-H7
	for openembedded-devel@openembedded.org; Tue, 17 Mar 2009 01:57:25 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LjNbk-0005GX-At
	for openembedded-devel@openembedded.org; Mon, 16 Mar 2009 19:56:40 -0500
Message-ID: <49BEF545.4040608@dls.net>
Date: Mon, 16 Mar 2009 19:56:37 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.19) Gecko/20081209 Thunderbird/2.0.0.19 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1237246365-32076-1-git-send-email-denis@denix.org>
In-Reply-To: <1237246365-32076-1-git-send-email-denis@denix.org>
X-SA-Exim-Connect-IP: 216.145.245.197
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE,
	SPF_PASS autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] rename packages/ to recipes/ per earlier agreement
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
X-List-Received-Date: Tue, 17 Mar 2009 00:57:25 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit


Denys Dmytriyenko wrote:
> Renaming packages/ directory to recipes/, as one of the several structural
> changes, was proposed by Koen[1] and agreed/approved by many. Since Koen
> currently doesn't have time/ability to do the change, and some people are
> too eager to wait any longer, he asked me to do it. Please ack/nack.

Ack.   But can you please tag the revision immediately preceeding the
commit of this change so we have some easy-to-reference point[*] in the
history?

- Mike

[*] In accordance with the laws of Murphy, doing this will ensure that
nobody will ever actually have to use this easy-to-reference point.


