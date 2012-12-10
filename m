Received: from p3plsmtpa06-04.prod.phx3.secureserver.net ([173.201.192.105])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <pab@pabigot.com>) id 1Ti2YO-0008Sm-62
	for openembedded-devel@lists.openembedded.org;
	Mon, 10 Dec 2012 13:33:49 +0100
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa06-04.prod.phx3.secureserver.net with 
	id ZoGj1k0041mTNtu01oGj4X; Mon, 10 Dec 2012 05:16:44 -0700
Message-ID: <50C5D2AA.6080006@pabigot.com>
Date: Mon, 10 Dec 2012 06:16:42 -0600
From: "Peter A. Bigot" <pab@pabigot.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120911 Thunderbird/15.0.1
MIME-Version: 1.0
To: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
References: <1354662118-31597-1-git-send-email-pab@pabigot.com>
	<CALbNGRT7R_4ZycbG+Fg5dJWBTmiXfbr3p+HK5b0rE=5qE_v6qw@mail.gmail.com>
	<20121210124326.5590b0ff@eb-e6520>
In-Reply-To: <20121210124326.5590b0ff@eb-e6520>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][danny][PATCH] Revert "libgphoto2: fix build"
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
X-List-Received-Date: Mon, 10 Dec 2012 12:33:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 12/10/2012 05:43 AM, Eric Bénard wrote:
> Hi Peter and Andreas,
>
> Le Wed, 5 Dec 2012 07:58:33 +0100,
> Andreas Müller <schnitzeltony@googlemail.com> a écrit :
>
>> On Wed, Dec 5, 2012 at 12:01 AM, Peter A. Bigot <pab@pabigot.com> wrote:
>>> From: "Peter A. Bigot" <pab@pabigot.com>
>>>
>>> This reverts commit 5febf70d37c7e9cf55fa7de5285531a810312e3a.
>>>
>>> Patch made in response to oe-core commit 841ea3c1c breaks builds using
>>> oe-core danny branch which branched before that commit.
>>>
>>> Signed-off-by: Peter A. Bigot <pab@pabigot.com>
> pushed to danny-next + Andreas' request concerning "gphoto2: fix
> gettext build error", please check the result is what you expect.

By inspection the result is what it should be, correcting the missed PR 
bump in the patch version I submitted.

Peter


