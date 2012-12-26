Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TnrHF-0005hu-8u
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Dec 2012 14:44:34 +0100
Received: by mail-vc0-f181.google.com with SMTP id gb30so8692592vcb.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Dec 2012 05:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=xP8y1XV/VQVREGMN1r2mWN8dOFltzSStkXSmMxfkijk=;
	b=k8cc/iHxDt8IMLKdiEDh6oa6FSFw8nGFOqIZtqZk2e3pbZNpcG3qRGtltPYHsk98Of
	mvDmgD3Le3xF2/VLcPpKBwFewyu5yFz3dQSqW+8099bUMjz0oNFKLXg5K0RV8RBgAit6
	l84Qd9JWaspoRxZrkMR6GkdKfFRLmeW6IVkQFBnloGVs+8ZwFC2kCEPn4Qt4YSv/vY7q
	N7cAgKyLhcEO0lIOBCfwzIFqpUL0uXemmQDRCmkGVA0DKbDF3KY8ymfrxvYQIZtPVynA
	3cO8jIuuetzVj5Vxg9Jm9DbtH+2Dy8XfQnY1Rj2VW+AEIy3vQcFOdL2nWGkPqaX00dsr
	MmEQ==
MIME-Version: 1.0
Received: by 10.58.34.4 with SMTP id v4mr29721376vei.57.1356528556228; Wed, 26
	Dec 2012 05:29:16 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Wed, 26 Dec 2012 05:29:16 -0800 (PST)
In-Reply-To: <20121226130115.GB8988@jama.palm1.palmone.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
	<20121226130115.GB8988@jama.palm1.palmone.com>
Date: Wed, 26 Dec 2012 14:29:16 +0100
Message-ID: <CALbNGRTvGC6_g9nRWjCuB8t-sLA35PWuPJKb8gT=NC_y2D5kOw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce/meta-gnome 00/12] meta-xfce updates
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
X-List-Received-Date: Wed, 26 Dec 2012 13:44:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 26, 2012 at 2:01 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Sun, Dec 23, 2012 at 02:02:29PM +0100, Andreas M=C3=BCller wrote:
>> The following changes since commit a623fd942f6561a425278cf9f114d212d06e5=
982:
>>
>>   samba: disable avahi and build without acl (2012-12-21 16:45:28 +0100)
>
> No new issues in world build with this patchset applied.
>
I know - these patches just add some functionality for xfce. I check
for the gnome/libnotify problem next days. My assumption is that
host-headers are dragged in somewhere but I need to check that.

'Unfortunately' I got a raspberry-pi for Christmas so I need to take
care first :-)

Andreas


