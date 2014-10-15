Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 7000F65D56
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Oct 2014 04:28:46 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id r10so534327pdi.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2014 21:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=4MJBRR1GTHrwQGnGt6kpIxQlqVGOLxW3fzDNZcIov9o=;
	b=LW3OXLNGfQ/9GOYwZE2FjWQqd8MmmPxUB30tbBvK9hChPz+ESg5EVjhXqILNVLzTMY
	GHvFb0vjKIbLLXvvDZ3QjX4NXcMRiaDSY8pliOJWLj9mEZPgYgfMnITTIXBmbUYzO1YJ
	QnTmNxxxJwViRGaEs5CxJaTiDEbC48sNPA0+Up5ggOkNbn/dcBEqjIVnBEic55dSDl7q
	7Ub3nNLa0xmLPRTIbeytmys+JBU5EHXleDPhl6iibqq/k6KsciD7WsRuStzEcy1kmPzJ
	G1W0fPY00Ro8fYJs2yADrDLmHfeU7QhMTj+kKlofeTnAXIYF+3so1kPzHLOMtwQVJaPW
	NfbQ==
X-Received: by 10.70.38.165 with SMTP id h5mr9510434pdk.121.1413347327425;
	Tue, 14 Oct 2014 21:28:47 -0700 (PDT)
Received: from ?IPv6:2601:c:9380:601:129:897e:8c20:5edf?
	([2601:c:9380:601:129:897e:8c20:5edf])
	by mx.google.com with ESMTPSA id
	oh5sm11373115pbc.76.2014.10.14.21.28.45 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Oct 2014 21:28:46 -0700 (PDT)
Message-ID: <543DF7FC.9040505@gmail.com>
Date: Tue, 14 Oct 2014 21:28:44 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Cliff Brake <cbrake@bec-systems.com>
References: <CAOd_LFzDxbcVWX10B=KS5F-LGYVv-XRza-HmqXtGt8QraNMojA@mail.gmail.com>
	<CAP9ODKq7ZbvWsFehHutdvT=ehbTbCtCHvN4g397-3HmcGPxdjQ@mail.gmail.com>
In-Reply-To: <CAP9ODKq7ZbvWsFehHutdvT=ehbTbCtCHvN4g397-3HmcGPxdjQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy] pull request imagemagick: fix SRC_URI
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
X-List-Received-Date: Wed, 15 Oct 2014 04:28:53 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Armin Kuster <akuster808@gmail.com>

On 10/14/2014 10:57 AM, Otavio Salvador wrote:
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>
>
> On Tue, Oct 14, 2014 at 11:52 AM, Cliff Brake <cbrake@bec-systems.com> wrote:
>> The following changes since commit 8e6f6e49c99a12a0382e48451f37adac0181362f:
>>
>>    libmikmod: Adjust SRC_URI (2014-09-26 09:22:37 -0400)
>>
>> are available in the git repository at:
>>
>>    https://github.com/cbrake/meta-openembedded.git daisy
>>
>> for you to fetch changes up to 518cd119a8724dbd485a5d5c5047de59e8fbd652:
>>
>>    imagemagick: fix SRC_URI (2014-10-14 10:49:48 -0400)
>>
>> ----------------------------------------------------------------
>> Javier Viguera (1):
>>        imagemagick: fix SRC_URI
>>
>>   meta-oe/recipes-support/imagemagick/imagemagick_6.8.8.bb | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>
>

