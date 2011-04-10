Received: from smtp2-g21.free.fr ([212.27.42.2])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Q8uyM-0003Vq-Rg
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Apr 2011 15:46:47 +0200
Received: from [192.168.1.15] (unknown [82.240.38.71])
	by smtp2-g21.free.fr (Postfix) with ESMTP id E96894B0083
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Apr 2011 15:43:44 +0200 (CEST)
Message-ID: <4DA1B40F.1000505@eukrea.com>
Date: Sun, 10 Apr 2011 15:43:43 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.15) Gecko/20110307 Fedora/3.1.9-0.39.b3pre.fc14
	Lightning/1.0b3pre Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4DA17BD1.8050500@eukrea.com>
In-Reply-To: <4DA17BD1.8050500@eukrea.com>
Subject: Re: [2011.03-maintenance] cherry-pick request
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
X-List-Received-Date: Sun, 10 Apr 2011 13:46:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 10/04/2011 11:43, Eric B=E9nard wrote:
> Hi Tom,
>
> is it possible to cherry-pick the following commits to 2011.03-maintena=
nce.
> They are part of your fixes for patches with ".." in path but only the =
ones
> for tcl/tk were merged into 2011.03-maintenance branch, thus for exampl=
e db5
> fails to compile on a Fedora 14.
>
sorry here are the right commits :

e35caa4763fab8f526c278437db7d8980a22d16d
642719105bbce6fcb51acb10e402f26a6b247f95
56ca4273121d116204c243df7c8725041c9973d9
c58a1c7d7a88f8ef5030bc1aa6d2f4164a9d8f6b
4ca7390508c8e0b6a5ded344f05e19fce4486585
467575f6e24c425987b14f5b5f32bd0714926bb2
e41ded5f413fdc54a526795c2a202484c2796b84
c9dcf0755d54cc55f262f31b0386e808748d311f
eea57d918ed83eebf63231269a67ee647209b4b6
e846c30034639a59c2c311c53eca6bf3a3d0f590
6dd7fb87399ee62b7ee24769e815e9aea2fd4fae
1904f45e2eeafc0ad0de51f4d21eca9e40a3edfd
8973564b1cbc7036955962a7f7311eee691f87ae
fcee0b548ee0d007789d40958e648e20f7e56a89


