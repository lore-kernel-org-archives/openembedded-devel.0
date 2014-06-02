Return-Path: <edsiper@gmail.com>
Received: from mail-ve0-f175.google.com (mail-ve0-f175.google.com
	[209.85.128.175])
	by mail.openembedded.org (Postfix) with ESMTP id 239346FA69
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Jun 2014 21:15:03 +0000 (UTC)
Received: by mail-ve0-f175.google.com with SMTP id jw12so5857118veb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Jun 2014 14:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=cHloiWa+uZNXzPPVrnwyFnl5NsrW3Jxp6oWa+SAT3tU=;
	b=mMiIHwNegIAh11u/e971cYHiLBIG5ZrEQihsyZObWFQ6GP/xLnCjY8bXV17FdrKjEc
	19k2DU1kE68dojdCVTHPrPe/q1d1SOQu7+OQ2Paunjx8Q40Gs7lnDHjbgGwEt6erXTsg
	SAuBdKr0BpncKFuchCH8k2dyaka0P+Byl4C06mHlpdSU5+KnR8s68m3siNZp7dWxCbeQ
	heg8IDBaxJlWbr3C++HQD4mZa4QoUYFsjhOVdjnLmboaNn96FrGoS3mfijmL+MNmnnbL
	qaO8/PRuc1bces4ZvKgPjhuynsU5R98Jlb0fU8rHZmT6TNq75ly+XT4yh3vOKKttkLB+
	Rmvg==
X-Received: by 10.58.47.36 with SMTP id a4mr260862ven.63.1401743704711; Mon,
	02 Jun 2014 14:15:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.167.72 with HTTP; Mon, 2 Jun 2014 14:14:44 -0700 (PDT)
In-Reply-To: <538CE517.4090102@communistcode.co.uk>
References: <1401741340-24934-1-git-send-email-eduardo@monkey.io>
	<538CE517.4090102@communistcode.co.uk>
From: Eduardo Silva <edsiper@gmail.com>
Date: Mon, 2 Jun 2014 15:14:44 -0600
Message-ID: <CAMAQheMD9A3VF2FH0QkTTCTz-5qQVHHT0BhzFjo8QW+NL-zRYA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] [meta-webserver]: add Monkey HTTP Server
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
X-List-Received-Date: Mon, 02 Jun 2014 21:15:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 2, 2014 at 2:56 PM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> Hi Eduardo,
>
> Just the one comment inline.
>
>
> On 02/06/2014 21:35, Eduardo Silva wrote:
>>
>> Signed-off-by: Eduardo Silva <eduardo@monkey.io>
>> ---
>>   .../recipes-httpd/monkey/monkey_1.5.0.bb           | 38
>> ++++++++++++++++++++++
>>   1 file changed, 38 insertions(+)
>>   create mode 100644 meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
>>
>> diff --git a/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
>> b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
>> new file mode 100644
>> index 0000000..c6f1a76
>> --- /dev/null
>> +++ b/meta-webserver/recipes-httpd/monkey/monkey_1.5.0.bb
>> @@ -0,0 +1,38 @@
>> +SUMMARY = "Fast and Lightweight HTTP Server for Linux"
>> +HOMEPAGE = "http://monkey-project.com"
>> +BUGTRACKER = "https://github.com/monkey/monkey/issues"
>> +
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> +
>> +PR = "r1"
>
>
> PR is no longer needed, remove.

new patch will be submitted.
thanks

