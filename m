Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <edoiron@cbnco.com>) id 1MfxV6-00009W-0m
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 17:00:01 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 76D2E54BA43
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 10:42:04 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17397-01 for <openembedded-devel@lists.openembedded.org>; 
	Tue, 25 Aug 2009 10:42:04 -0400 (EDT)
Received: from [172.20.22.61] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 538AB54B0DA
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Aug 2009 10:42:04 -0400 (EDT)
Message-ID: <4A93F7F2.7030207@cbnco.com>
Date: Tue, 25 Aug 2009 10:40:50 -0400
From: Evan Doiron <edoiron@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1251140186-26944-1-git-send-email-edoiron@cbnco.com>
	<19c1b8a90908241337y3f3f9239x6470ecbe91ab2d63@mail.gmail.com>
In-Reply-To: <19c1b8a90908241337y3f3f9239x6470ecbe91ab2d63@mail.gmail.com>
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Re: [PATCH] rsync: add v3.0.6
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
X-List-Received-Date: Tue, 25 Aug 2009 15:00:18 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Khem Raj wrote:
> On Mon, Aug 24, 2009 at 11:56 AM, Evan Doiron<edoiron@cbnco.com> wrote:
>   
>> +do_compile_prepend() {
>> +        sed -i "s/conf_stop make_stop//" Makefile
>> +}
>>     
>
> this you can make as do_configure_append instead IMO
>   
Hi Khem Raj,

Thanks for your input, and in fact it turns out that v3.0.6 does not
need this, where v3.0.0 did.
-Evan

-- 
Evan Doiron
Software Developer
Canadian Bank Note Company Limited
edoiron@cbnco.com



