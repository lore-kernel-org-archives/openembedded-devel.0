Received: from tritech.se ([46.59.120.190])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Mats.Karrman@tritech.se>) id 1RJ0GV-0004J5-Fj
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Oct 2011 11:59:19 +0200
Received: from post.tritech.se (post.tritech.se [10.75.60.100])
	by tritech.se (8.14.3/8.14.3) with ESMTP id p9Q9rCth025550
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Oct 2011 11:53:17 +0200
Received: from POST.tritech.se ([fe80::b4fc:968e:bbef:54cb]) by
	post.tritech.se ([fe80::b4fc:968e:bbef:54cb%11]) with mapi id
	14.01.0270.001; Wed, 26 Oct 2011 11:53:13 +0200
From: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [2011.03-maintenance] Pull request for binutils (+
	waiting for master patch)
Thread-Index: AQHMk8UTJ88duWzr0USdkxkjVC/SRQ==
Date: Wed, 26 Oct 2011 09:53:12 +0000
Message-ID: <ED3E0BCACD909541BA94A34C4A164D4C4013DA2E@post.tritech.se>
Accept-Language: en-US, sv-SE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [194.132.137.34]
MIME-Version: 1.0
Subject: Re: [2011.03-maintenance] Pull request for binutils (+ waiting for master patch)
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
X-List-Received-Date: Wed, 26 Oct 2011 09:59:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Apologies for mixing up my binutil issues...=0A=
=0A=
I have submitted a patch: "[PATCH] binutils_2.18: update SRC_URI to avoid m=
anual delete" that is in patchwork now. I am following the mailing list, bu=
t have seen no comments about it.=0A=
=0A=
What I do hope for is this patch to be committed so that I can pick this on=
e and a related one and create a maintenance pull request for both.=0A=
=0A=
Perhaps I'm just too impatient...=0A=
=0A=
BR // Mats=0A=
=0A=
________________________________________=0A=
From: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel=
-bounces@lists.openembedded.org] on behalf of Anders Darander [anders@charg=
estorm.se]=0A=
Sent: Wednesday, October 26, 2011 11:00 AM=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: Re: [oe] [2011.03-maintenance] Pull request for binutils=0A=
=0A=
On 26 okt 2011, at 09:03, "Mats K=E4rrman" <Mats.Karrman@tritech.se> wrote:=
=0A=
=0A=
> Thanks to all for your support!=0A=
>=0A=
> I'm thinking that it would be great if the patch first went into master. =
Then I could pick both the binutils 2.18 related patches from there. So I s=
tarted to look for information about how to make the patch go to master. I =
then discovered that the patch is already in patchwork but I fail to see ho=
w I make it go from there to being committed, considering I'm a user withou=
t repo write permission. Could someone tell me the next steps or point me t=
o somewhere where this is described?=0A=
=0A=
Well, if the patch has already been sent (and thus exists in the patchwork)=
 there could be either one of a few situations:=0A=
=0A=
* it's recently submitted, and no one has had any time to look into it yet.=
=0A=
* it could have been overlooked.=0A=
* it could have received comments that need to be addressed before it can b=
e committed.=0A=
=0A=
So you could always check to see if you can find any discussions of the pat=
ch on this list, otherwise ask the question again.=0A=
=0A=
Cheers,=0A=
Anders=0A=
=0A=
> BR // Mats=0A=
> ________________________________________=0A=
> From: openembedded-devel-bounces@lists.openembedded.org [openembedded-dev=
el-bounces@lists.openembedded.org] on behalf of Denys Dmytriyenko [denis@de=
nix.org]=0A=
> Sent: Tuesday, October 25, 2011 7:43 PM=0A=
> To: openembedded-devel@lists.openembedded.org=0A=
> Subject: Re: [oe] [2011.03-maintenance] Pull request for binutils=0A=
>=0A=
> On Tue, Oct 25, 2011 at 09:50:30AM +0200, Anders Darander wrote:=0A=
>> * Mats K?rrman <Mats.Karrman@tritech.se> [111025 09:37]:=0A=
>>> I'm sorry for the slow progress but I'm working 100% on something else=
=0A=
>>> so this is overtime...=0A=
>>=0A=
>> Unfortunately a too common situation...=0A=
>>=0A=
>>> What is the correct practice; to fork the oe repository at GitHub or=0A=
>>> to create a "username/maintenance" branch in the same repo?=0A=
>>=0A=
>> Well, unless you already have a git account, with rw permission=0A=
>> openembedded.org (and thus can push to e.g. openembedded), the easiest=
=0A=
>> thing should be to use another hosting. I'm using github for my=0A=
>> pull-requests to meta-oe and oe-core.=0A=
>>=0A=
>> If you do that, just:=0A=
>> 1) fork openembedded on github=0A=
>> 2) add the remote to you local git-tree=0A=
>> 3) push your local branch to github, using i.e. `git push github=0A=
>> featureXXX`, assuming that you named the remote github.=0A=
>=0A=
> Just don't forget that you want your personal tree be at the tip of=0A=
> 2011.03-maintenance branch, not the master oe.dev (which would otherwise =
be=0A=
> similar to what you just sent). Then you can cherry-pick the needed commi=
t,=0A=
> push it to github and generate a pull request.=0A=
>=0A=
> --=0A=
> Denys=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
>=0A=
> _______________________________________________=0A=
> Openembedded-devel mailing list=0A=
> Openembedded-devel@lists.openembedded.org=0A=
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=0A=


