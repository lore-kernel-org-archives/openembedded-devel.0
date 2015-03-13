Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id EB6B86013D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2015 14:14:36 +0000 (UTC)
Received: (qmail 19475 invoked by uid 1003); 13 Mar 2015 14:14:36 -0000
Received: from unknown (HELO ?192.168.11.101?)
	(philip@opensdr.com@71.171.10.241)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	13 Mar 2015 14:14:36 -0000
Message-ID: <5502F0C9.8050009@balister.org>
Date: Fri, 13 Mar 2015 10:14:33 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAAKMwirhdq7H2ULjwOXCOfs3JEWCXJR2QyyCmGjFuf1uF6Doqg@mail.gmail.com>
	<CAGiJk9cTPf8TOg+h2rYbsT-Pvyo6EbDkR1_ps+dRPkx=43d9zQ@mail.gmail.com>
In-Reply-To: <CAGiJk9cTPf8TOg+h2rYbsT-Pvyo6EbDkR1_ps+dRPkx=43d9zQ@mail.gmail.com>
Subject: Re: How is the process to add a recipe to meta-oe?
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
X-List-Received-Date: Fri, 13 Mar 2015 14:14:37 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/13/2015 07:23 AM, Samuel Stirtzel wrote:
> 2015-03-13 12:08 GMT+01:00 Kai Ulrich <kaiu@gmx.de>:
>> Hi,
>>
>> I created an layer with a recipe for smstools3.
>> You can find it on https://github.com/kaiulrich/meta-smstools3
>> I would like to share my work with the openembedded commity.
>> How is the process to add a recipe to meta-oe?
>>
> 
> See:
> http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
> 
> Also see the README file of the layer where you want to put the recipe in
> 
> 

It might be a good candidate for meta-telephony.

http://layers.openembedded.org/layerindex/branch/master/layer/meta-telephony/

Philip

