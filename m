Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1Tumha-0002vK-Uw
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Jan 2013 17:16:00 +0100
Message-ID: <50F42A14.9010805@communistcode.co.uk>
Date: Mon, 14 Jan 2013 15:53:56 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130109 Thunderbird/17.0.2
MIME-Version: 1.0
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
References: <1358170889-23714-1-git-send-email-ml@communistcode.co.uk>
	<20130114145239.32ca274f@e6520eb>
In-Reply-To: <20130114145239.32ca274f@e6520eb>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] hiawatha: update to 8.7
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
X-List-Received-Date: Mon, 14 Jan 2013 16:16:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 01/14/13 13:52, Eric Bénard wrote:
> Hi Jack,
>
> Le Mon, 14 Jan 2013 13:41:29 +0000,
> ml@communistcode.co.uk a écrit :
>
>> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>>
>> Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
>> ---
>>   .../recipes-httpd/hiawatha/files/xslt-fix.patch    | 71 ----------------------
>>   .../recipes-httpd/hiawatha/hiawatha_8.7.bb         | 56 +++++++++++++++++
>>   2 files changed, 56 insertions(+), 71 deletions(-)
>>   delete mode 100644 meta-webserver/recipes-httpd/hiawatha/files/xslt-fix.patch
>>   create mode 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.7.bb
>>
> I think you forget to delete hiawatha_8.6.bb
>
> Eric

That I did, I removed it from the directory but not from git. Will send 
a v2 (also with correct subject tomorrow), snow permitting for us Brits ;)


