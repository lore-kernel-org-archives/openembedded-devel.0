Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5AE7160EE8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Sep 2013 22:16:56 +0000 (UTC)
Message-ID: <52338ED8.7080701@communistcode.co.uk>
Date: Fri, 13 Sep 2013 23:16:56 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130806 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1379078395-23592-1-git-send-email-ml@communistcode.co.uk>
	<CAP9ODKonACidq+Yk-vqnM5=N94kbvJLArDu7_U3Co1v3TCHcXg@mail.gmail.com>
In-Reply-To: <CAP9ODKonACidq+Yk-vqnM5=N94kbvJLArDu7_U3Co1v3TCHcXg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libsoc: new recipe
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
X-List-Received-Date: Fri, 13 Sep 2013 22:16:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 13/09/13 22:29, Otavio Salvador wrote:
> On Fri, Sep 13, 2013 at 10:19 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
>> From: Jack Mitchell <jack@embed.me.uk>
> ...
>> +DEPENDS = "libgcc"
>
> Does this is really need?
>

Hi Otavio,

There was some conversation about this in another revision of the patch. 
It's been changed now to RDEPENDS and I've just posted a v5 for review.

Cheers,
Jack.

-- 
   Jack Mitchell (jack@embed.me.uk)
   Embedded Systems Engineer
   Cambrideshire, UK
   http://www.embed.me.uk
--

