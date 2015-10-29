Return-Path: <prvs=7372357f8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id BD980755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 18:51:59 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmIGAIRpMlasEApK/2dsb2JhbABehHgGuwWGCYYZAoF+AQEBAQEBgQtBEwGDYQEBBHgRCw0LCRYPCQMCAQIBRQYNBgICiDHFSAEBCCOGd4R+hRcXhBYBBJZDlj4XkwaDJ4FBcYIJgm6BBwEBAQ
X-IPAS-Result: AmIGAIRpMlasEApK/2dsb2JhbABehHgGuwWGCYYZAoF+AQEBAQEBgQtBEwGDYQEBBHgRCw0LCRYPCQMCAQIBRQYNBgICiDHFSAEBCCOGd4R+hRcXhBYBBJZDlj4XkwaDJ4FBcYIJgm6BBwEBAQ
Message-ID: <56326A97.4040107@skidata.com>
Date: Thu, 29 Oct 2015 19:51:03 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <D1946B41-2BFF-49FA-A4C7-19A2A1D6C731@gmail.com>
	<5631CDAD.7030703@skidata.com>
	<A34BC9F8-F519-435B-B65A-26A533F78877@gmail.com>
	<CAP9ODKrh9kxCTf3es2Oypx3rPNiKp9Fb3Nk6xafgrc=R+JEkwg@mail.gmail.com>
	<9E01DDA7-C832-4E17-B17A-25850D0B27B5@gmail.com>
	<563208F3.1040900@skidata.com>
	<CAP9ODKoUv+-WXzXNEKdFWwFDbJnQGXZtiZzqXtBzS7MmwOXkYA@mail.gmail.com>
	<56324006.8040905@skidata.com>
	<CAP9ODKrnG2biyhwNESgA8DBQcaMgYZ39kdRTFU4Cv6PgvAjg4Q@mail.gmail.com>
In-Reply-To: <CAP9ODKrnG2biyhwNESgA8DBQcaMgYZ39kdRTFU4Cv6PgvAjg4Q@mail.gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 4/4] openjdk-8: add recipes for openjdk-8 and openjre-8
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
X-List-Received-Date: Thu, 29 Oct 2015 18:52:01 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 10/29/2015 05:03 PM, Otavio Salvador wrote:
> On Thu, Oct 29, 2015 at 1:49 PM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>>
>> What indentation should be chosen? Tabs? Spaces (how much)?
>> Maybe I have also time to fix that in the recipes-core.
> 
> I would prefer 4 spaces.
> 

Generally I prefer real tabs displayed with 8 spaces width (like the
linux kernel coding style). But of course I will stick to the formatting
rules if we have one in OE layers ;-)

Is there a generally considered rule/advisory across all OE layers or
meta-java?
If yes, where do I find it?
If no, wouldn't that be a good idea? (and of course write it down!)

best regards,
Richard L

