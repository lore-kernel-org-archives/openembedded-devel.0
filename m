Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 648036D323
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2013 07:39:34 +0000 (UTC)
Received: (qmail 13635 invoked by uid 1003); 24 Oct 2013 07:39:36 -0000
Received: from unknown (HELO ?10.111.49.239?)
	(philip@opensdr.com@109.144.255.190)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	24 Oct 2013 07:39:35 -0000
Message-ID: <5268CEB6.7030401@balister.org>
Date: Thu, 24 Oct 2013 08:39:34 +0100
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAGJTLJ6MLtO_neHZq7QoER7Vs4JCLnfXZbxHeKhtV53V2+PDkw@mail.gmail.com>
	<52685AB2.2060606@balister.org>
	<CAGJTLJ5z=8Wjj2WOzid3MuaJEErc_Qja93bk5Uponw-aXwcxQA@mail.gmail.com>
In-Reply-To: <CAGJTLJ5z=8Wjj2WOzid3MuaJEErc_Qja93bk5Uponw-aXwcxQA@mail.gmail.com>
X-Enigmail-Version: 1.5.2
Subject: Re: Issues Building Numpy
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
X-List-Received-Date: Thu, 24 Oct 2013 07:39:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/24/2013 12:29 AM, Stephen Harrison wrote:
> Hi,
> 
> Yes I do have these libraries installed on the build machine. Are you
> saying I need to uninstall them?

Or fix the numpy build to not find them on the build machine :)

Philip

> 
> 
> 
> 
> On Wed, Oct 23, 2013 at 4:24 PM, Philip Balister <philip@balister.org>wrote:
> 
>> Do you have atlas, blas etc installed on the build machine. As I recall
>> the numpy recipe is weak and tends to finds things installed on the
>> build machine.
>>
>> Philip
>>
>> On 10/23/2013 08:22 PM, Stephen Harrison wrote:
>>> Hi,
>>>
>>> I am trying to build an image for the Zedboard (ARM) platform. I can't
>> seem
>>> to build the Numpy package and I can't quite understand why.
>>>
>>> I've attached the compile log. I've noticed there are many complaints
>> about
>>> ATLAS, BLAS etc not being available and other errors about executables
>>> being in the wrong format.
>>>
>>> Any help would be much appreciated.
>>>
>>> Regards,
>>>
>>> Stephen
>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> 
> 

