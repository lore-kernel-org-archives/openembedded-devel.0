Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1Rd1D8-0006P9-D2
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Dec 2011 16:02:36 +0100
Received: by iakh37 with SMTP id h37so6778596iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Dec 2011 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to:x-mailer;
	bh=nl5Bi+7Dn5pkk1pR7sbJBN2azFCiXlX/t54wNq0l9pI=;
	b=PGkLx3+S+0YJdUXeAPAoNzTlqp0ZZ5FwqNVWLA3Gjz+sPYDisJxvvrfHwY8/6UNioe
	XGpngKLKmuspOoqpT/u8eFikH6mOTZ/0/D1P2GVqt6RsQayyDVM6+GwYWmX3Et2SF42I
	DF7Z4/gFhZA18EdJ82CtuE4y+zX+kpyp60P2Y=
Received: by 10.50.182.199 with SMTP id eg7mr2615112igc.57.1324392929597;
	Tue, 20 Dec 2011 06:55:29 -0800 (PST)
Received: from [192.168.0.4] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id 36sm6024460ibc.6.2011.12.20.06.55.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Dec 2011 06:55:28 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Tom Rini <tom.rini@gmail.com>
In-Reply-To: <4EF03CBF.9020306@dresearch-fe.de>
Date: Tue, 20 Dec 2011 07:55:30 -0700
Message-Id: <98F54633-659A-4E67-9913-694E9A1DCD72@gmail.com>
References: <cover.1323862499.git.sledz@dresearch-fe.de>
	<CA+M6bXk57+wbvAzkLrZVDPCvhGFLH8A-A3ESNnW_-Yk=TiDfLw@mail.gmail.com>
	<4EE995AB.5090503@dresearch-fe.de>
	<4EEEE51E.6040306@dresearch-fe.de>
	<CA+M6bXn5CCfETj1qctbPyCt5qB4=9em-K2af78x0W6QEA2ZxsQ@mail.gmail.com>
	<4EEF56B3.7000909@dresearch-fe.de>
	<CA+M6bXk5AmQAvFDUG4WRGnBUCGwSYqvheS3xGWJeH42_+5410g@mail.gmail.com>
	<4EEF673A.6050200@dresearch-fe.de>
	<CA+M6bXmi_v8eG0gFooZ2JyOpVfk1XzXSH4RCQyBm3LtJjvKdqQ@mail.gmail.com>
	<4EF03CBF.9020306@dresearch-fe.de>
To: Steffen Sledz <sledz@dresearch-fe.de>
X-Mailer: Apple Mail (2.1251.1)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/5] pull request 20111214
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
X-List-Received-Date: Tue, 20 Dec 2011 15:02:36 -0000
X-Groupsio-MsgNum: 36224
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F719BA35-A90F-4CD5-BBF5-473D94AEE28C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F719BA35-A90F-4CD5-BBF5-473D94AEE28C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

On Dec 20, 2011, at 12:43 AM, Steffen Sledz wrote:

> Am 19.12.2011 18:40, schrieb Tom Rini:
>> On Mon, Dec 19, 2011 at 9:32 AM, Steffen Sledz =
<sledz@dresearch-fe.de> wrote:
>>> On 19.12.2011 16:28, Tom Rini wrote:
>>>> On Mon, Dec 19, 2011 at 8:22 AM, Steffen Sledz =
<sledz@dresearch-fe.de> wrote:
>>>>> On 19.12.2011 15:39, Tom Rini wrote:
>>>>>> On Mon, Dec 19, 2011 at 12:17 AM, Steffen Sledz =
<sledz@dresearch-fe.de> wrote:
>>>>>>> On 15.12.2011 07:37, Steffen Sledz wrote:
>>>>>>>> Am 14.12.2011 19:07, schrieb Tom Rini:
>>>>>>>>> On Wed, Dec 14, 2011 at 4:40 AM, Steffen Sledz =
<sledz@dresearch-fe.de> wrote:
>>>>>>>>>> Hi Tom,
>>>>>>>>>>=20
>>>>>>>>>> please pull these 5 commits cherry-picked from oe.dev.
>>>>>>>>>> All of them are bugfixes and tested in our own environment.
>>>>>>>>>>=20
>>>>>>>>>> Thx,
>>>>>>>>>> Steffen
>>>>>>>>>>=20
>>>>>>>>>> The following changes since commit =
9826895e30baa597a5ec433cc0ebd52f5f6c8796:
>>>>>>>>>>=20
>>>>>>>>>> Merge remote-tracking branch 'upstream/2011.03-maintenance' =
into sledz/maintenance (2011-12-09 14:06:08 +0100)
>>>>>>>>>>=20
>>>>>>>>>> are available in the git repository at:
>>>>>>>>>>=20
>>>>>>>>>> git://git.openembedded.org/openembedded sledz/maintenance
>>>>>>>>>> =
http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=3Dsledz/maintena=
nce
>>>>>>>>>>=20
>>>>>>>>>> Stefan Schmidt (2):
>>>>>>>>>> llvm2.7_2.7: Add patch for build errors on newer gcc / glibc
>>>>>>>>>>   combinations
>>>>>>>>>> llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>>>>>>>>=20
>>>>>>>>>> Steffen Sledz (3):
>>>>>>>>>> live555: replace version 20110314 with 20111120
>>>>>>>>>> icedtea6-native: fix problem on build hosts with linux kernel =
3.x
>>>>>>>>>> openjdk: fix problem on build hosts with linux kernel 3.x
>>>>>>>>>=20
>>>>>>>>> Only 1 2 and 3 made it to the ML.
>>>>>>>>=20
>>>>>>>> Please have a second look. They all should be there.
>>>>>>>>=20
>>>>>>>>> 1 and 2 are fine.  For 3, we should
>>>>>>>>> grab the old file (someone must have a copy) and stick that on
>>>>>>>>> sources.openembedded.org.
>>>>>>>>=20
>>>>>>>> The version replacement is not just for the well known live555 =
download problem. It fixes some other problems too. Also the version =
introduced by this patch is already uploaded to sources.openembedded.org =
and the angstrom mirrors.
>>>>>>>=20
>>>>>>> Ping!
>>>>>>=20
>>>>>> Sorry for the delay.  Especially since I'm now going to ask you =
to
>>>>>> rebase the branch.  Here's what I get after merging your request:
>>>>>> $ git log --oneline origin..
>>>>>> b6cc3be87 Merge branch 'sledz/maintenance' of =
git://git.openembedded.org/openemb
>>>>>> eda1aaf openjdk: fix problem on build hosts with linux kernel 3.x
>>>>>> 4500148 icedtea6-native: fix problem on build hosts with linux =
kernel 3.x
>>>>>> cb5b2fb live555: replace version 20110314 with 20111120
>>>>>> 3904feb llvm2.7_2.7.bb: Update patch to use c++ include style.
>>>>>> a992bc4 llvm2.7_2.7: Add patch for build errors on newer gcc / =
glibc combination
>>>>>> 9826895 Merge remote-tracking branch =
'upstream/2011.03-maintenance' into sledz/m
>>>>>> ebb70fd gypsy: update to latest upstream version 0.8, and remove =
version 0.7
>>>>>> 69186cf gypsy: move generic SRC_URI part to gypsy.inc
>>>>>> 7f9e803 gypsy: fix packaging of DBus starter script
>>>>>> 45b8af8 rsyslog: change path for config includes to =
/etc/rsyslog.d
>>>>>> 77a5200 Revert "gypsy: fix packaging of DBus starter script"
>>>>>> 105f8ae Revert "gypsy: move generic SRC_URI part to gypsy.inc"
>>>>>> 701d1cb Revert "gypsy: update to latest upstream version 0.8, and =
remove version
>>>>>> 593bb51 Revert "rsyslog: change path for config includes to =
/etc/rsyslog.d"
>>>>>> de3065d gypsy: update to latest upstream version 0.8, and remove =
version 0.7
>>>>>> dbb8899 gypsy: move generic SRC_URI part to gypsy.inc
>>>>>> 9bef377 gypsy: fix packaging of DBus starter script
>>>>>> 772286e Merge remote-tracking branch =
'upstream/2011.03-maintenance' into sledz/m
>>>>>> ef52795 rsyslog: change path for config includes to =
/etc/rsyslog.d
>>>>>>=20
>>>>>> I'm sure it's all unintentional.
>>>>>=20
>>>>> The pull request contains the last five commits only ("The =
following changes since commit =
9826895e30baa597a5ec433cc0ebd52f5f6c8796").
>>>>>=20
>>>>> Maybe i need some help in using git here. How should i prepare my =
branch to fulfil your requirements?
>>>>=20
>>>> Are others using your branch?  If not, git push <name of your =
writable
>>>> OE remote> :sledz/maintenance to delete your current branch, git
>>>> rebase -i origin/2011.03-maintenance (and remove the commits you no
>>>> longer want) then git push <name of writeable OE remote>
>>>> local-branch:sledz/maintenance.
>>>=20
>>> Sorry, but i need some more guidance here. Everytime i think i made =
it another problem drives me crazy. :(
>>>=20
>>> Assuming i've a fresh local clone created with
>>>=20
>>> git clone git@git.openembedded.org:openembedded
>>>=20
>>> What are the exact next stepts?
>>>=20
>>> I tried
>>>=20
>>> git checkout sledz/maintenance
>>> git rebase -i origin/2011.03-maintenance    # unwanted commits =
removed
>>> git push origin sledz/maintenance
>>>=20
>>> The last results in
>>>=20
>>> To git@git.openembedded.org:openembedded
>>>  ! [rejected]        sledz/maintenance -> sledz/maintenance =
(non-fast-forward)
>>> error: failed to push some refs to =
'git@git.openembedded.org:openembedded'
>>> To prevent you from losing history, non-fast-forward updates were =
rejected
>>> Merge the remote changes (e.g. 'git pull') before pushing again.  =
See the
>>> 'Note about fast-forwards' section of 'git push --help' for details.
>>=20
>> You either need to do the git push
>> git@git.openembedded.org:openembedded :sledz/maintenance (to delete
>> the old one) and if that fails (it used to be that only admins could
>> delete branches, just push instead to sledz/pull-request-19dec2011 or
>> so :)
>=20
> Could not delete the remote branch (admins only).
>=20
> Please pull from branch sledz/pull.


Applied, thanks.

--=20
Tom


--Apple-Mail=_F719BA35-A90F-4CD5-BBF5-473D94AEE28C
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7woeMACgkQdZngf2G4WwN3LQCdEs7whWRoCTrua6AEDRGp9BE8
8fYAn1z58zEnmdyyPqaQj5w4qbBDmlSP
=GKQV
-----END PGP SIGNATURE-----

--Apple-Mail=_F719BA35-A90F-4CD5-BBF5-473D94AEE28C--
