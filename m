Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 700D2770E6
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Feb 2016 08:07:35 +0000 (UTC)
Received: (qmail 28165 invoked by uid 1003); 2 Feb 2016 08:07:35 -0000
Received: from unknown (HELO ?192.168.1.43?) (philip@opensdr.com@91.177.26.95)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	2 Feb 2016 08:07:35 -0000
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <1453998177-24110-1-git-send-email-philip@balister.org>
	<5510016.r0vissdbSN@peggleto-mobl.ger.corp.intel.com>
From: Philip Balister <philip@balister.org>
Message-ID: <56B063C5.8070202@balister.org>
Date: Tue, 2 Feb 2016 09:07:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <5510016.r0vissdbSN@peggleto-mobl.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-python][PATCH] python-vcversioner: Fix bad DESCRIPTION and HOMEPAGE entries.
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
X-List-Received-Date: Tue, 02 Feb 2016 08:07:39 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 01/28/2016 06:34 PM, Paul Eggleton wrote:
> On Thu, 28 Jan 2016 11:22:57 Philip Balister wrote:
>> Copy/paste is the root of all evil.
>>
>> Signed-off-by: Philip Balister <philip@balister.org>
>> ---
>>  meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git
>> a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
>> b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb index
>> 152034b..6c96875 100644
>> --- a/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
>> +++ b/meta-python/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
>> @@ -1,5 +1,5 @@
>> -DESCRIPTION = "Twisted Web Sockets"
>> -HOMEPAGE = "https://github.com/MostAwesomeDude/txWS"
>> +DESCRIPTION = "Python vcversioner"
>> +HOMEPAGE = "https://github.com/habnabit/vcversioner"
> 
> Sorry to pick on this, I know you're fixing a completely wrong description, 
> but:
> 
> * Short descriptions should go in SUMMARY
> * This is a pretty useless short description, it doesn't do anything beyond 
> what the recipe name does.

Can you remind us what fields the layer index is using? I noticed the
issue using the layer index to look somehting up.

Philip


> 
> Cheers,
> Paul
> 

