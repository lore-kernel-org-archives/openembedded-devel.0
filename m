Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <david.thomas@microbee-systems.com>)
	id 1RQ1zO-0005zz-Ev for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 20:14:42 +0100
Received: by wyg8 with SMTP id 8so1817296wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 11:08:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.227.205.130 with SMTP id fq2mr16765095wbb.17.1321297700959;
	Mon, 14 Nov 2011 11:08:20 -0800 (PST)
Received: by 10.227.200.14 with HTTP; Mon, 14 Nov 2011 11:08:20 -0800 (PST)
In-Reply-To: <20111114190400.GD311@jama.jama.net>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
	<20111114190400.GD311@jama.jama.net>
Date: Mon, 14 Nov 2011 13:08:20 -0600
Message-ID: <CALJpqJzOZeF3sKSdSjAtbA=vhwf53daa=2hqaVzVEpCoVV+xMg@mail.gmail.com>
From: David Thomas <david.thomas@microbee-systems.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: GCC Error
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
X-List-Received-Date: Mon, 14 Nov 2011 19:14:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

gcc version 4.4.3 (Ubuntu 4.4.3-4ubuntu5)

Sigh, update time?

Appreciate the help. Not sure why the beagleboard test I ran compiles
but not this one...

Dave



On Mon, Nov 14, 2011 at 1:04 PM, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> On Mon, Nov 14, 2011 at 12:55:37PM -0600, David Thomas wrote:
>> I am getting a gcc error
>
> What recipe is failing with this?
>
>> cc1: error: -Werror=3Dunused-but-set-variable: No option -Wunused-but-se=
t-variable
>
> and what gcc version is used in that Angstrom version you're using?
>
> This option was added to gcc-4.6, so if you have 4.5 then it will
> probably fail if recipe is forcing such option to CFLAGS.
>
> Cheers,
>
>> Using the Angstrom scripts I can run machine=3Dbeagleboard and complete.
>> However, machine=3Dcm-t35 with a cm-t35.conf file throws this error.
>>
>> I am having to guess that the machine file is all that was required,
>> it seems to pich all the right arch, etc.
>>
>> I had asked on Angstrom for any CM-T35 related info to no avail...
>>
>> --
>> Dave Thomas
>> MicroBee Systems, Inc
>> 1429 Weatherly Road, Suite G
>> Huntsville, AL 35803-1187
>> 256-489-6671 (Voice)
>> 256-426-2431 (Mobile)
>> 256-489-6673 (FAX)
>> www.microbee-systems.com
>> "Innovative Solutions for an Embedded World"
>>
>> This message is intended for the sole use of the addressee, and may
>> contain information that is privileged, confidential and exempt from
>> disclosure under applicable law. If you are not the addressee you are
>> hereby notified that you may not use, copy, disclose, or distribute to
>> anyone the message or any information contained in the message. If you
>> have received this message in error, please immediately advise the
>> sender by reply email and delete this message.
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa =A0 =A0 jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>



--=20
Dave Thomas
MicroBee Systems, Inc
1429 Weatherly Road, Suite G
Huntsville, AL 35803-1187
256-489-6671 (Voice)
256-426-2431 (Mobile)
256-489-6673 (FAX)
www.microbee-systems.com
"Innovative Solutions for an Embedded World"

This message is intended for the sole use of the addressee, and may
contain information that is privileged, confidential and exempt from
disclosure under applicable law. If you are not the addressee you are
hereby notified that you may not use, copy, disclose, or distribute to
anyone the message or any information contained in the message. If you
have received this message in error, please immediately advise the
sender by reply email and delete this message.


