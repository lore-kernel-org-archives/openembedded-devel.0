Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RkIo4-0006la-1Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jan 2012 18:14:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q09G22Hp024547
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 9 Jan 2012 08:02:02 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 9 Jan 2012 08:02:01 -0800
Message-ID: <4F0B0F7A.9020907@windriver.com>
Date: Mon, 9 Jan 2012 10:02:02 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <cover.1325876341.git.otavio@ossystems.com.br>
	<b61f46cb503582b669cbc56b0ea04d7fdaafd256.1325876341.git.otavio@ossystems.com.br>
	<1325879877.3234.2.camel@lenovo.internal.reciva.com>
	<CAP9ODKqpDS=sJQ-uuP5+E6QOMU7eQheWXqk+TSA4fkpwha6LVw@mail.gmail.com>
	<4F0763FD.9000801@windriver.com>
	<CAP9ODKrhfnL_+VJNWFQ0J7uyw3yayZ-e+gnyzsp4gjivxdtL2Q@mail.gmail.com>
	<CAP9ODKo+uNuXx+jmN6uiFgG9nuwEuTjwc2JDpXnrygyp88j=rQ@mail.gmail.com>
In-Reply-To: <CAP9ODKo+uNuXx+jmN6uiFgG9nuwEuTjwc2JDpXnrygyp88j=rQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 5/5] udisks: disable manpage building
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
X-List-Received-Date: Mon, 09 Jan 2012 17:14:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 1/6/12 4:21 PM, Otavio Salvador wrote:
> On Fri, Jan 6, 2012 at 19:49, Otavio Salvador<otavio@ossystems.com.br>wrote:
>
>> On Fri, Jan 6, 2012 at 19:13, Mark Hatle<mark.hatle@windriver.com>  wrote:
>>
>>> In what way?  Most of the problems I've observed in the past have been
>>> docbook related, but I think those have been resolved within OE-Core.
>>>
>>
>> Docbook related problems; you prefer if we fix those then?
>>
>
> It uses xsltproc and there's no native recipe at this moment.
>

Hmm, I think the best solution is to fix the docbook problems, but baring that a 
static version of the man pages is the next best alternative.

Advantage to fixing docbook is it will work for the next package.  :)

--Mark


