<form method="POST" action="/profile">
    @csrf
    <select name="timezone">
        @foreach(DateTimeZone::listIdentifiers() as $timezone)
            <option value="{{ $timezone }}">{{ $timezone }}</option>
        @endforeach
    </select>
    <button type="submit">Save</button>
</form>
