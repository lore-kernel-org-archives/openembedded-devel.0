Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with ESMTP id 53A3172F5B
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Mar 2017 18:55:46 +0000 (UTC)
Received: (qmail 24119 invoked by uid 1003); 28 Mar 2017 18:55:48 -0000
Received: from unknown (HELO ?192.168.11.142?)
	(philip@opensdr.com@108.44.116.166)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	28 Mar 2017 18:55:48 -0000
To: Trevor Woerner <twoerner@gmail.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYsTtk9eFD=kdhdrtFUCPr-eOn5dnPxDR+hM9LRbL40ug@mail.gmail.com>
	<CAHUNapRmymF0Z2s1aGhxNAusk35cj6Wg2uqYWDrZTNTMXYkYTQ@mail.gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <db923476-2e79-5d55-a887-3658d00ecc59@balister.org>
Date: Tue, 28 Mar 2017 14:55:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapRmymF0Z2s1aGhxNAusk35cj6Wg2uqYWDrZTNTMXYkYTQ@mail.gmail.com>
Subject: Re: Meson build system
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
X-List-Received-Date: Tue, 28 Mar 2017 18:55:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/28/2017 02:10 PM, Trevor Woerner wrote:
> On Tue, Jul 26, 2016 at 9:31 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> FWIW I started looking at packaging and writing a class for the Meson build
>> system (mesonbuild.com) last night.  It's not finished and needs quite a
>> lot of work, but if anyone has a need for Meson or just fancies finishing
>> it off as a project then I can share the recipes and braindump what's left
>> to do.
> 
> 
> With the X system converting to meson, it looks like this is going to
> become rather important to have.
> 

And
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/classes/meson.bbclass

Philip

