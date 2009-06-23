Received: from [206.46.173.1] (helo=vms173001pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1MIvbt-0003Cs-Io
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Jun 2009 04:19:48 +0200
Received: from gandalf.denix.org ([71.251.63.232]) by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KLO001EV5YI4YU1@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	22 Jun 2009 21:08:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DC33D14AF5F; Mon,
	22 Jun 2009 22:08:41 -0400 (EDT)
Date: Mon, 22 Jun 2009 22:08:41 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090623020841.GM14716@denix.org>
References: <200906041838.05838.marcin@juszkiewicz.com.pl>
	<1245664435-30183-10-git-send-email-marcin@juszkiewicz.com.pl>
	<h1nog0$af4$3@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <h1nog0$af4$3@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [STABLE][PATCH 033/125] m4: 1.4.11 and 1.4.12 are GPLv3
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
X-List-Received-Date: Tue, 23 Jun 2009 02:19:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Jun 22, 2009 at 01:04:32PM +0200, Koen Kooi wrote:
> On 22-06-09 11:53, Marcin Juszkiewicz wrote:
>> From: Tom Rini<trini@embeddedalley.com>
>>
>>
>> Signed-off-by: Marcin Juszkiewicz<marcin@juszkiewicz.com.pl>
>
> Acked-by: Koen Kooi <koen@openembedded.org>

Acked-by: Denys Dmytriyenko <denis@denix.org>

>> ---
>>   recipes/m4/m4_1.4.11.bb |    2 +-
>>   recipes/m4/m4_1.4.12.bb |    2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes/m4/m4_1.4.11.bb b/recipes/m4/m4_1.4.11.bb
>> index 77d8e82..e267626 100644
>> --- a/recipes/m4/m4_1.4.11.bb
>> +++ b/recipes/m4/m4_1.4.11.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro 
>> \
>>   processor."
>> -LICENSE = "GPL"
>> +LICENSE = "GPLv3"
>>   SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
>>   S = "${WORKDIR}/m4-${PV}"
>>
>> diff --git a/recipes/m4/m4_1.4.12.bb b/recipes/m4/m4_1.4.12.bb
>> index 77d8e82..e267626 100644
>> --- a/recipes/m4/m4_1.4.12.bb
>> +++ b/recipes/m4/m4_1.4.12.bb
>> @@ -1,6 +1,6 @@
>>   DESCRIPTION = "GNU m4 is an implementation of the traditional Unix macro 
>> \
>>   processor."
>> -LICENSE = "GPL"
>> +LICENSE = "GPLv3"
>>   SRC_URI = "${GNU_MIRROR}/m4/m4-${PV}.tar.gz"
>>   S = "${WORKDIR}/m4-${PV}"
>>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


