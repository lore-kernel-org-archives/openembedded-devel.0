Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1PETof-0002ha-A0
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Nov 2010 22:27:22 +0100
Received: by qyk9 with SMTP id 9so2425819qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Nov 2010 14:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JxiQlv3rpFyICtXmzSzZKgArxFeQxrco6+qV8m61l24=;
	b=VbRcXiGenxSttZsRFUn8TaNsnt6JlBLaBZwYaj7x8i8T9HrtxtWaaIsftisRQuSuo+
	XI8XByDAoMWYPdFy8NDc5Vp+RUcU0lcCtBwLX/12I/dfhESvfXbL4jZZ3rA3gNQs3GqQ
	rhHkzfhSrqT15m3ofWl6aQuvKWSFp1gBD+hVc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=GqlHlHY3Duo5VdV6NJSMKebC96IWQAnJPiZ2YIcoCPmDqZ1r5kSyicHwUHk5udxCx/
	EFGn03UpncINvtw4L8/0kW4A3MEXsIK2itRngav6a8coAN4qoh5b03MIvbRWTVvWVZlC
	qwdX7glSaSD5bPGB2qHmbRNP33seDN57iUJEc=
MIME-Version: 1.0
Received: by 10.224.200.198 with SMTP id ex6mr1403689qab.14.1288992387717;
	Fri, 05 Nov 2010 14:26:27 -0700 (PDT)
Received: by 10.220.118.5 with HTTP; Fri, 5 Nov 2010 14:26:27 -0700 (PDT)
In-Reply-To: <AANLkTikKjYKJNqMONi+Xq5q-nkkpaWFk9SbT5nipWKUR@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
	<AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
	<AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
	<AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
	<AANLkTimO6whzKHNQ2eCUagkg-HD7Ke2CzPv6r65-Fc0L@mail.gmail.com>
	<AANLkTi=F8n-nKQPhW35xmm2LRx_LnADO1vYN+LghJUL7@mail.gmail.com>
	<AANLkTikemy4VUkVAjk8zBtB6+jT=Q2VV1vAojrNwQP9O@mail.gmail.com>
	<AANLkTikKjYKJNqMONi+Xq5q-nkkpaWFk9SbT5nipWKUR@mail.gmail.com>
Date: Fri, 5 Nov 2010 14:26:27 -0700
Message-ID: <AANLkTi=DsjB_u-QKZqi2em8s0KS4DUtLn2TK+9O8jYBO@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problems building openldap and libtool
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
X-List-Received-Date: Fri, 05 Nov 2010 21:27:22 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 4, 2010 at 12:39 AM, J. L. <vwyodapink@gmail.com> wrote:
> On Thu, Nov 4, 2010 at 12:27 AM, J. L. <vwyodapink@gmail.com> wrote:
>> On Wed, Nov 3, 2010 at 6:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Wed, Nov 3, 2010 at 5:46 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>> On Wed, Nov 3, 2010 at 4:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>> On Wed, Nov 3, 2010 at 4:36 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>>>> On Wed, Nov 3, 2010 at 4:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>>>>> On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>>>>>> I am having an issue of how libtool is building on my machine. I a=
m
>>>>>>>> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
>>>>>>>> overo branch. Here is what happens when building:
>>>>>>>>
>>>>>>>> Error for openldap
>>>>>>>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>>>>>>>> ERROR: Function do_configure failed
>>>>>>>> NOTE: Task failed: ('function do_configure failed',
>>>>>>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/op=
enldap-2.4.23-r2/temp/log.do_configure.12815')
>>>>>>>> ERROR: Logfile of failure stored in:
>>>>>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/ope=
nldap-2.4.23-r2/temp/log.do_configure.12815
>>>>>>>> Log data follows:
>>>>>>>> | cp: cannot stat
>>>>>>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueab=
i/usr/share/libtool/ltmain.sh':
>>>>>>>> No such file or directory
>>>>>>>
>>>>>>> can you add DEPENDS +=3D "libtool" to openldap_2.4.23.bb and retry =
?
>>>>>>
>>>>>> Still getting this error and I cleaned and rebuilt both recipes
>>>>>
>>>>> try this patch and remove that DEPENDS
>>>>>
>>>>> diff --git a/recipes/openldap/openldap_2.4.23.bb
>>>>> b/recipes/openldap/openldap_2.4.23.bb
>>>>> index 3ac15f6..8afd951 100644
>>>>> --- a/recipes/openldap/openldap_2.4.23.bb
>>>>> +++ b/recipes/openldap/openldap_2.4.23.bb
>>>>> @@ -188,7 +188,7 @@ DEPENDS =A0 =A0 =A0+=3D "${OPENLDAP_DEPENDS}"
>>>>> =A0CPPFLAGS_append =3D " -D_GNU_SOURCE"
>>>>>
>>>>> =A0do_configure() {
>>>>> - =A0 =A0 =A0 cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S}/bui=
ld
>>>>> + =A0 =A0 =A0 cp ${STAGING_ETCDIR_NATIVE}/libtool/config/ltmain.sh ${=
S}/build
>>>>> =A0 =A0 =A0 =A0rm -f ${S}/libtool
>>>>> =A0 =A0 =A0 =A0aclocal
>>>>> =A0 =A0 =A0 =A0libtoolize --force --copy
>>>>>
>>>>>
>>>>>>
>>>>>> ERROR: Logfile of failure stored in:
>>>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openl=
dap-2.4.23-r2/temp/log.do_configure.2783
>>>>>> Log data follows:
>>>>>> | cp: cannot stat
>>>>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/=
usr/share/libtool/ltmain.sh':
>>>>>> No such file or directory
>>>>>> | ERROR: Function do_configure failed
>>>>>> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>>>>>>
>>>>>>
>>>>>> libtool does not build to this location
>>>>>> /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/u=
sr/share/libtool/
>>>>>> it builds to here
>>>>>> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tm=
p/sysroots/x86_64-linux/usr/share/libtool/
>>>>>>
>>>>>> It seems to put home/vdubhack/overo-oe/tmp the incorrect way. instea=
d
>>>>>> of being in front of the tmp/sysroot like most things
>>>>>>
>>>>>> same with aclocal and aclocal-1.11
>>>>>>
>>>>>> Thanks
>>>>>>
>>>>>> JL
>>>>>>>
>>>>>>>
>>>>>>> -khem
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Openembedded-devel mailing list
>>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-de=
vel
>>>>>>>
>>>>>>
>>>>>> _______________________________________________
>>>>>> Openembedded-devel mailing list
>>>>>> Openembedded-devel@lists.openembedded.org
>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-dev=
el
>>>>>>
>>>>>
>>>>> _______________________________________________
>>>>> Openembedded-devel mailing list
>>>>> Openembedded-devel@lists.openembedded.org
>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-deve=
l
>>>>>
>>>>
>>>> Did as you asked and also deleted the tmp/ dir to just make sure was
>>>> nothing in there and rebuilt. And must not have done something right
>>>> as the patch failed with this:
>>>> ERROR: Logfile of failure stored in:
>>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openlda=
p-2.4.23-r2/temp/log.patch_do_patch.22762
>>>> Log data follows:
>>>> | ERROR: Error in executing python function in:
>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap=
_2.4.23.bb
>>>> | ERROR: Exception:<class 'oe.patch.CmdError'> Message:Command Error:
>>>> exit status: 1 =A0Output:
>>>> | Applying patch test-fix.patch
>>>> | patching file recipes/openldap/openldap_2.4.23.bb
>>>> | Hunk #1 FAILED at 188.
>>>> | 1 out of 1 hunk FAILED -- rejects in file recipes/openldap/openldap_=
2.4.23.bb
>>>> | Patch test-fix.patch does not apply (enforce with -f)
>>>> | ERROR: Printing the environment of the function
>>>> | ERROR: Function patch_do_patch failed
>>>> NOTE: package openldap-2.4.23-r2: task do_patch: Failed
>>>> =A0I have attached the patch and the .bb so you can see what and how I=
 did it.
>>>>
>>>
>>> crap.
>>> dude you make that one line change in the recipe .bb file *by hand*
>>> its not a patch for the sources
>>> but for the recipe.
>>>
>>>
>>>> Thanks for the help so far.
>>>>
>>>> JL
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> Sorry didnt catch it was for the recipe my bad. I changed the line and
>> still a no go, it's still looking where libtool does not build to.
>>
>> ERROR: Build of
>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2=
.4.23.bb
>> do_configure failed
>> NOTE: Running task 4058 of 9443 (ID: 6423,
>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2=
.4.23.bb,
>> do_configure)
>> ERROR: Task 6423
>> (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_=
2.4.23.bb,
>> do_configure) failed with 256
>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>> ERROR: Function do_configure failed
>> NOTE: Task failed: ('function do_configure failed',
>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap=
-2.4.23-r2/temp/log.do_configure.14912')
>> ERROR: Logfile of failure stored in:
>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-=
2.4.23-r2/temp/log.do_configure.14912
>> Log data follows:
>> | cp: cannot stat
>> `/home/vdubhack/overo-oe/tmp/sysroots/x86_64-linux/etc/libtool/config/lt=
main.sh':
>> No such file or directory
>> | ERROR: Function do_configure failed
>> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>>
>> Thanks for the help suggestions so far. I think for some reason
>> libtool does not build properly from how I read as to how its shows
>> its installed on the system
>> =A0tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp=
/sysroots/x86_64-linux/usr/share/libtool/
>>
>
>
>
> Sorry but just noticed in the libtool recipe this line
> FILES_${PN} +=3D "${datadir}/aclocal*"
> My aclocal and aclocal-1.11 dont appear to be building to the proper
> location either for some reason they build to here
>
> find tmp/sysroots -name "aclocal"
> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sys=
roots/x86_64-linux/usr/share/aclocal
> =A0-- this one is the same place libtool goes to as you can see for some
> reason my home and username /home/vdubhack/overo-oe gets thrown in for
> some reason in the middle of it.
>
> Here is the rest of the places it goes to.
> tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal
> tmp/sysroots/x86_64-linux/usr/share/aclocal
> tmp/sysroots/x86_64-linux/usr/armv7a/share/aclocal
> tmp/sysroots/x86_64-linux/usr/bin/aclocal
>
> aclocal-1.11 does the same
> find tmp/sysroots -name "aclocal-1.11"
> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sys=
roots/x86_64-linux/usr/share/aclocal-1.11
> =A0-- /home/vdubhack/overo-oe gets thrown in the wrong place here as
> well
>
> And the rest of the aclocal-1.11 places it gets installed to.
> tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/aclocal-1.11
> tmp/sysroots/x86_64-linux/usr/share/aclocal-1.11
> tmp/sysroots/x86_64-linux/usr/armv7a/share/aclocal-1.11
> tmp/sysroots/x86_64-linux/usr/bin/aclocal-1.11
>
>
> Hope this might help more. Thanks again.
> JL
>



Khem,
I switched to the main branch as you suggested in the other thread and
here is the error I get on this. Also moving to the main branch breaks
angstrom-version for me as well as a few more.

ERROR: Logfile of failure stored in:
/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4=
.23-r2/temp/log.do_configure.20089
Log data follows:
| cp: cannot stat
`/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/sha=
re/libtool/config/ltmain.sh':
No such file or directory
| ERROR: Function do_configure failed
NOTE: package openldap-2.4.23-r2: task do_configure: Failed
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openldap/openldap_2.4.=
23.bb
do_configure failed
ERROR: Task 11 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/openld=
ap/openldap_2.4.23.bb,
do_configure) failed with 256


libtool still builds to the same place as mentioned earlier in the thread.

Thanks again for your help so far.

JL


